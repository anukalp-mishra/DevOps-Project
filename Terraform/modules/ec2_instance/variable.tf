variable "instance_type" {
  description = "Terraform EC2 instance"
  type        = string
}

variable "key_name" {
  type        = string
  description = "AWS EC2 Key Pair"
}

variable "private_key_path" {
  type        = string
  description = "Private key file to connect over SSH"
}

variable "public_key_path" {
  description = "Path to the public SSH public key file"
  type        = string
}