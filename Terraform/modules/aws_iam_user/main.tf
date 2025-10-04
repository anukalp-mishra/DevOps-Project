resource "aws_iam_user" "new_user"{
    count = length(var.user_names)
    name = var.user_names[count.index]
}