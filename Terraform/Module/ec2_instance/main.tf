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

output "my_output" {
    value = aws_instance.new_instance.public_ip
}
