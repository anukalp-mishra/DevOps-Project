resource "null_resource" "announce" {
      triggers = {
            instance_id = aws_instance.web.id
      }

        provisioner "local-exec" {
                command = "echo Deployed ${aws_instance.web.id} with public_ip=${aws_instance.web.public_ip}"
        }
}
        }
      }
}