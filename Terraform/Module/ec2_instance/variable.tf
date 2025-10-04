variable "instance_type" {
  description = "Terraform EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "user_names" {
  description = "user names terraform"
  type = list(string)
  default = ["user1","user2"]
}
