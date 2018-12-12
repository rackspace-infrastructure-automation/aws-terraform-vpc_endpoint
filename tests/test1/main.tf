provider "aws" {
  version = "~> 1.2"
  region  = "us-west-2"
}

module "base_network" {
  source   = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=master"
  vpc_name = "VPC-Endpoint-Test"
}

module "security_groups" {
  source        = "git@github.com:rackspace-infrastructure-automation/aws-terraform-security_group?ref=v0.0.3"
  resource_name = "test_sg"
  vpc_id        = "${module.base_network.vpc_id}"
}

module "vpc_endpoint" {
  source                                  = "../../module"
  resource_name                           = "VPC-Endpoint-Testing"
  vpc_id                                  = "${module.base_network.vpc_id}"
  route_tables_ids_list                   = "${module.base_network.private_route_tables}"
  security_group_ids_list                 = ["${module.security_groups.vpc_endpoint_security_group_id}"]
  subnet_ids_list                         = "${module.base_network.private_subnets}"
  dynamo_db_endpoint_enable               = true
  s3_endpoint_enable                      = true
  codebuild_endpoint_enable               = true
  codebuild_private_dns_enable            = true
  codebuild-fips_endpoint_enable          = false
  codebuild-fips_private_dns_enable       = false
  ec2_endpoint_enable                     = true
  ec2_private_dns_enable                  = true
  ec2messages_endpoint_enable             = true
  ec2messages_private_dns_enable          = true
  elasticloadbalancing_endpoint_enable    = true
  elasticloadbalancing_private_dns_enable = true
  events_endpoint_enable                  = true
  events_private_dns_enable               = true
  execute-api_endpoint_enable             = true
  execute-api_private_dns_enable          = true
  kinesis-streams_endpoint_enable         = true
  kinesis-streams_private_dns_enable      = true
  kms_endpoint_enable                     = true
  kms_private_dns_enable                  = true
  logs_endpoint_enable                    = true
  logs_private_dns_enable                 = true
  monitoring_endpoint_enable              = true
  monitoring_private_dns_enable           = true
  sagemaker_runtime_endpoint_enable       = true
  sagemaker_runtime_private_dns_enable    = true
  secretsmanager_endpoint_enable          = true
  secretsmanager_private_dns_enable       = true
  servicecatalog_endpoint_enable          = true
  servicecatalog_private_dns_enable       = true
  sns_endpoint_enable                     = true
  sns_private_dns_enable                  = true
  ssm_endpoint_enable                     = true
  ssm_private_dns_enable                  = true
}

output "s3_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.s3_vpc_endpoint_id}"
}

output "dynamodb_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.dynamodb_vpc_endpoint_id}"
}

output "codebuild_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.codebuild_vpc_endpoint_id}"
}

output "codebuild-fips_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.codebuild-fips_vpc_endpoint_id}"
}

output "ec2_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.ec2_vpc_endpoint_id}"
}

output "ec2messages_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.ec2messages_vpc_endpoint_id}"
}

output "elasticloadbalancing_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.elasticloadbalancing_vpc_endpoint_id}"
}

output "events_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.events_vpc_endpoint_id}"
}

output "execute-api_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.execute-api_vpc_endpoint_id}"
}

output "kinesis-streams_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.kinesis-streams_vpc_endpoint_id}"
}

output "kms_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.kms_vpc_endpoint_id}"
}

output "logs_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.logs_vpc_endpoint_id}"
}

output "monitoring_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.monitoring_vpc_endpoint_id}"
}

output "sagemaker_runtime_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.sagemaker_runtime_vpc_endpoint_id}"
}

output "secretsmanager_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.secretsmanager_vpc_endpoint_id}"
}

output "servicecatalog_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.servicecatalog_vpc_endpoint_id}"
}

output "sns_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.sns_vpc_endpoint_id}"
}

output "ssm_vpc_endpoint_id" {
  value = "${module.vpc_endpoint.ssm_vpc_endpoint_id}"
}
