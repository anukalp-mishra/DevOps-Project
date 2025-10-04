output "my_output" {
    value = aws_instance.new_instance.public_ip
}