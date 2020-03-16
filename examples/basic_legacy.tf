terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.7"
  region  = "us-west-2"
}

module "base_network" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=v0.12.0"

  name = "VPC-Endpoint-Exammple"
}

module "vpc_endpoint" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint?ref=v0.12.0"

  dynamo_db_endpoint_enable = true
  route_tables              = module.base_network.private_route_tables
  s3_endpoint_enable        = true
  vpc_id                    = module.base_network.vpc_id
}
