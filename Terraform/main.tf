module "ec2_instance" {
  source        = "./modules/ec2_instance"
  public_key_path = var.public_key_path
  instance_type = var.instance_type
  key_name         = var.key_name
  private_key_path = var.private_key_path
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