resource "aws_db_subnet_group" "rds_subnets" {
  name       = "rdspvtsubnets"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "rdsSubnets"
  }
}

resource "aws_db_parameter_group" "rdspostgres" {
  name   = "rdspostgres"
  family = "postgres11"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}


resource "aws_db_instance" "rdspostgres" {
  identifier             = "rdspostgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "11.22-rds.20240418"
  username               = "vishtyagi"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  parameter_group_name   = aws_db_parameter_group.rdspostgres.name
  publicly_accessible    = false
  skip_final_snapshot    = true
}
