resource "aws_vpc" "mod_net" {

  count = var.existing_vpc_id == "" ? 1 : 0

  cidr_block = var.cidr_block

  tags = {
    Name       = "${var.app_prefix}-network"
    app_prefix = var.app_prefix
  }
}

data "aws_vpc" "existing_net" {
  count = var.existing_vpc_id == "" ? 0 : 1
  id    = var.existing_vpc_id
}

locals {
  vpc_id     = var.existing_vpc_id == "" ? aws_vpc.mod_net[0].id : var.existing_vpc_id
  cidr_block = var.existing_vpc_id == "" ? aws_vpc.mod_net[0].cidr_block : data.aws_vpc.existing_net[0].cidr_block
}


resource "aws_subnet" "mod_subnets" {
  vpc_id = local.vpc_id # use the corret VPC"s ID

  count = var.subnet_count

  cidr_block = cidrsubnet(local.cidr_block, 8, count.index + 1)

  tags = {
    Name       = "${var.app_prefix}-subnet-${count.index + 1}"
    app_prefix = var.app_prefix
  }
}

