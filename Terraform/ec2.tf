resource "aws_instance" "web" {
      ami                         = data.aws_ami.amazon_linux2.id
        instance_type               = var.instance_type
          subnet_id                   = var.subnet_id != null ? var.subnet_id : element(data.aws_subnets.default_vpc_subnets.ids, 0)
            vpc_security_group_ids      = [aws_security_group.web_sg.id]
              associate_public_ip_address = var.enable_public_ip

                user_data = <<-EOT
                              #!/bin/bash
                                            set -euo pipefail
                                                          yum update -y
                                                                        amazon-linux-extras install nginx1 -y || yum install -y nginx
                                                                                      echo "<h1>${local.name_prefix} — Terraform EC2</h1>" > /usr/share/nginx/html/index.html
                                                                                                    systemctl enable nginx
                                                                                                                  systemctl start nginx
                                                                                                                                EOT

                                                                                                                                  lifecycle {
                                                                                                                                        create_before_destroy = true
                                                                                                                                  }

                                                                                                                                    tags = merge(local.common_tags, { Name = "${local.name_prefix}-web" })
}
                                                                                                                                  }
}