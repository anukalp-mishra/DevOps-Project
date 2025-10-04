resource "aws_instance" "new_instance" {
    ami = "ami-02d26659fd82cf299"
    instance_type = var.instance_type
    tags = {
        Name = "Terraform EC2"
    }
}