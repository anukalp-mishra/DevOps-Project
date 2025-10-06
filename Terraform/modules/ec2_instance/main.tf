resource "aws_key_pair" "this" {
  key_name   = "aws_key"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "new_instance" {
    ami = "ami-02d26659fd82cf299"
    instance_type = var.instance_type
    key_name      = aws_key_pair.this.key_name

    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "file" {
    source = "/Users/anukalp/TestDir/Test.yml"
    destination = "/home/ubuntu/Test.yml"
  }

  provisioner "local-exec" {
    command = "touch hello_terra.tf"
  }


    user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello from Terraform instance id `curl http://169.254.169.254/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html
      EOF

    tags = {
        Name = "Terraform EC2"
    }
}