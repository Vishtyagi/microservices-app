terraform {
  backend "s3" {
    bucket = "microservice-tfstate"
    key    = "microservice/tfstate"
    region = "eu-west-1"
  }
}
