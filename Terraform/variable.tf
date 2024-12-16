variable "kubernetes_version" {
  default     = 1.27
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}

variable "db_password" {
  description = "RDS root user password"
  default = "Welcometestuser123#"
  type        = string
  sensitive   = true
}
