variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name prefix"
  type        = string
  default     = "tf-demo"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "enable_public_ip" {
  description = "Associate a public IP with the instance"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "Optional existing VPC ID"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Optional existing Subnet ID"
  type        = string
  default     = null
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}
