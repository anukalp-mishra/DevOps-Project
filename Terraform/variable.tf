
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "user_names" {
  type = list(string)
}

variable "key_name" {
  default = "aws_key"
}

variable "private_key_path" {
  default = "/Users/anukalp/key/aws/aws_key"
}

variable "public_key_path" {
  description = "Path to the public SSH key"
  type        = string
}