module "vpc" {
  source     = "./vpc"
  cidr_block = var.vpc_cidr_block
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}

module "ebs_volume" {
  source = "./ebs_volume"
}

module "iam" {
  source = "./iam"
}

module "s3" {
  source = "./s3"
}

module "ec2" {
  source             = "./ec2"
  subnet_id          = module.vpc.public_subnet_id
  security_group_id  = module.security_group.sg_id
  ebs_volume_id      = module.ebs_volume.volume_id
  iam_role_name      = module.iam.iam_role_name
  user_data_path     = "${path.module}/ec2/scripts/user_data.sh"
  ami_id             = var.ami_id
}
