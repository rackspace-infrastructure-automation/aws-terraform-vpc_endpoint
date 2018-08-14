provider "aws" {
  version = "~> 1.2"
  region  = "us-west-2"
}

module "base_network" {
  source   = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=v0.0.1"
  vpc_name = "VPC-Endpoint-Exammple"
}

module "vpc_endpoint" {
  source                    = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint?ref=v0.0.1"
  resource_name             = "VPC-Endpoint-Exammple"
  vpc_id                    = "${module.base_network.vpc_id}"
  route_tables_ids_list     = "${module.base_network.private_route_tables}"
  dynamo_db_endpoint_enable = true
  s3_endpoint_enable        = true
}

output "s3_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.s3_vpc_endpoint_id}"
}

output "dynamodb_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.dynamodb_vpc_endpoint_id}"
}
