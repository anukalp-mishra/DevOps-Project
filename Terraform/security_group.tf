resource "aws_security_group" "web_sg" {
      name        = "${local.name_prefix}-web-sg"
        description = "Allow SSH and HTTP"
          vpc_id      = coalesce(var.vpc_id, data.aws_vpc.default.id)

            ingress {
                    description = "SSH"
                        from_port   = 22
                            to_port     = 22
                                protocol    = "tcp"
                                    cidr_blocks = ["0.0.0.0/0"]
            }

              ingress {
                    description = "HTTP"
                        from_port   = 80
                            to_port     = 80
                                protocol    = "tcp"
                                    cidr_blocks = ["0.0.0.0/0"]
              }

                egress {
                        from_port   = 0
                            to_port     = 0
                                protocol    = "-1"
                                    cidr_blocks = ["0.0.0.0/0"]
                }

                  tags = merge(local.common_tags, { Name = "${local.name_prefix}-sg" })
}
                }
              }
            }
}