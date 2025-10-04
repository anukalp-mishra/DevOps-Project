
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "user_names" {
  type = list(string)
}