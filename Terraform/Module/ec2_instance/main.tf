provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "new_instance" {
    ami = ""
    instance_type = ""
}