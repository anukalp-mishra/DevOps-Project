locals {
  name_prefix = "${var.project}-${terraform.workspace}"

  common_tags = merge(
    var.tags,
    {
      Project     = var.project
      Environment = terraform.workspace
    }
  )
}
