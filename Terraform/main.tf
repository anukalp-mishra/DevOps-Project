module "ec2_instance" {
  source        = "./modules/ec2_instance"
  instance_type = var.instance_type
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
}

module "iam_user" {
  source     = "./modules/aws_iam_user"
  user_names = var.user_names
}

/*terraform {
    backend "s3" {
        bucket = "my-s3-bucket-terraform-21"
        key = "key/terraform.tfstate"
        region = "ap-south-1"
    }
}*/