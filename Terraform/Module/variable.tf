variable "instance_type" {
  description = "Terraform EC2 instance"
  type        = string
}

variable "user_names" {
  description = "user names terraform"
  type = list(string)
}
