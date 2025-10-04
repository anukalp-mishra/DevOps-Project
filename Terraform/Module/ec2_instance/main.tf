provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "new_instance" {
    ami = "ami-02d26659fd82cf299"
    instance_type = var.instance_type
    tags = {
        Name = "Terraform EC2"
    }
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-s3-bucket-terraform-21"
}

resource "aws_iam_user" "new_user" {
    count = length(var.user_names)
    name = var.user_names[count.index]
}

output "my_output" {
    value = aws_instance.new_instance.public_ip
}
