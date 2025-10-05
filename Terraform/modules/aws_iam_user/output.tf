output "iam_user_output" {
    value = [for name in var.user_names : name]
}