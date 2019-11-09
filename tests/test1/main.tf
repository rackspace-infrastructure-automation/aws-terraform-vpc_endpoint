provider "aws" {
  version = "~> 2.35"
  region  = "us-west-2"
}

provider "random" {
  version = "~> 2.0"
}

locals {
  tags = {
    Environment     = "Test"
    Identifier      = "${random_string.identifier.result}"
    Purpose         = "Testing aws-terraform-vpc_endpoint"
    ServiceProvider = "Rackspace"
    Terraform       = "true"
  }
}

resource "random_string" "identifier" {
  length  = 6
  special = false
  lower   = true
  upper   = false
  number  = false
}

module "base_network" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=master"

  vpc_name = "VPC-Endpoint-${random_string.identifier.result}"
}

module "security_groups" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-security_group?ref=v0.0.3"

  environment   = "${lookup(local.tags, "Environment")}"
  resource_name = "test_sg"
  vpc_id        = "${module.base_network.vpc_id}"
}

module "vpc_endpoint" {
  source = "../../module"

  codebuild_endpoint_enable               = true
  codebuild_private_dns_enable            = true
  codebuild_fips_endpoint_enable          = false
  codebuild_fips_private_dns_enable       = false
  dynamo_db_endpoint_enable               = true
  ec2_endpoint_enable                     = true
  ec2_private_dns_enable                  = true
  ec2messages_endpoint_enable             = true
  ec2messages_private_dns_enable          = true
  elasticloadbalancing_endpoint_enable    = true
  elasticloadbalancing_private_dns_enable = true
  environment                             = "${lookup(local.tags, "Environment")}"
  events_endpoint_enable                  = true
  events_private_dns_enable               = true
  execute_api_endpoint_enable             = true
  execute_api_private_dns_enable          = true
  kinesis_streams_endpoint_enable         = true
  kinesis_streams_private_dns_enable      = true
  kms_endpoint_enable                     = true
  kms_private_dns_enable                  = true
  logs_endpoint_enable                    = true
  logs_private_dns_enable                 = true
  monitoring_endpoint_enable              = true
  monitoring_private_dns_enable           = true
  route_tables_ids_list                   = "${module.base_network.private_route_tables}"
  s3_endpoint_enable                      = true
  sagemaker_runtime_endpoint_enable       = true
  sagemaker_runtime_private_dns_enable    = true
  secretsmanager_endpoint_enable          = true
  secretsmanager_private_dns_enable       = true
  security_group_ids_list                 = ["${module.security_groups.vpc_endpoint_security_group_id}"]
  servicecatalog_endpoint_enable          = true
  servicecatalog_private_dns_enable       = true
  sns_endpoint_enable                     = true
  sns_private_dns_enable                  = true
  sqs_endpoint_enable                     = true
  sqs_private_dns_enable                  = true
  ssm_endpoint_enable                     = true
  ssm_private_dns_enable                  = true
  subnet_ids_list                         = "${module.base_network.private_subnets}"
  tags                                    = "${local.tags}"
  vpc_id                                  = "${module.base_network.vpc_id}"
}
