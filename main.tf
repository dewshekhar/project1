module "aws_core_infra" {
  #source              = "./module/aws_core_infra"
  source = "github.com/dewshekhar/core-infra.git"
  app_name            = local.app_name
  vpc_cidr            = var.vpc_cidr
  pub_sub_cidr_1      = var.pub_sub_cidr_1
  pub_sub_cidr_2      = var.pub_sub_cidr_2
  pri_sub_cidr_1      = var.pri_sub_cidr_1
  pri_sub_cidr_2      = var.pri_sub_cidr_2
 # availability_zone_1 = var.availability_zone_1
 # availability_zone_2 = var.availability_zone_2
}

data "aws_caller_identity" "current" {}

#resource "aws_kms_key" "this" {}

module "users_unencrypted" {
  source = "github.com/dewshekhar/terraform-aws-sqs.git"
  #source = "../../"
  name = "users-unencrypted"
  tags = {
    Secure = "false"
  }
}
