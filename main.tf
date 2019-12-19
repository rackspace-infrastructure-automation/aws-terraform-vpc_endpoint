/**
 * # aws-terraform-vpc_endpoint
 *
 * This module builds VPC endpoints based on the inputs.
 *
 * ## Basic Usage
 *
 * ```HCL
 * module "vpc_endpoint" {
 *   source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint?ref=v0.12.0"
 *
 *   dynamo_db_endpoint_enable = true
 *   s3_endpoint_enable        = true
 *   vpc_id                    = "${module.base_network.vpc_id}"
 *
 *   route_tables = concat(
 *     module.base_network.private_route_tables,
 *     module.base_network.public_route_tables
 *   )
 * }
 * ```
 *
 * Full working references are available at [examples](examples)
 *
 *## Terraform 0.12 upgrade
 *
 *Several changes were required while adding terraform 0.12 compatibility.  The following changes should be
 *made when upgrading from a previous release to version 0.12.0 or higher.
 *
 *### Module variables
 *
 *The following module variables were updated to better meet current Rackspace style guides:
 *
 *- `route_tables_ids_list` -> `route_tables`
 *- `security_group_ids_list` -> `security_groups`
 *- `subnet_ids_list` -> `subnets`
 */

terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = ">= 2.1.0"
  }
}

locals {
  tags = {
    ServiceProvider = "Rackspace"
    Environment     = var.environment
  }

  merged_tags = merge(local.tags, var.tags)
}

data "aws_region" "current_region" {}

resource "aws_vpc_endpoint" "s3_endpoint" {
  count = var.s3_endpoint_enable ? 1 : 0

  route_table_ids   = var.route_tables
  service_name      = "com.amazonaws.${data.aws_region.current_region.name}.s3"
  tags              = local.merged_tags
  vpc_endpoint_type = "Gateway"
  vpc_id            = var.vpc_id
}

resource "aws_vpc_endpoint" "dynamo_endpoint" {
  count = var.dynamo_db_endpoint_enable ? 1 : 0

  route_table_ids   = var.route_tables
  service_name      = "com.amazonaws.${data.aws_region.current_region.name}.dynamodb"
  tags              = local.merged_tags
  vpc_endpoint_type = "Gateway"
  vpc_id            = var.vpc_id
}

# codebuild
resource "aws_vpc_endpoint" "codebuild_endpoint" {
  count = var.codebuild_endpoint_enable ? 1 : 0

  private_dns_enabled = var.codebuild_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.codebuild"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# codebuild-fips
resource "aws_vpc_endpoint" "codebuild_fips_endpoint" {
  count = var.codebuild_fips_endpoint_enable ? 1 : 0

  private_dns_enabled = var.codebuild_fips_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.codebuild-fips"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# ec2
resource "aws_vpc_endpoint" "ec2_endpoint" {
  count = var.ec2_endpoint_enable ? 1 : 0

  private_dns_enabled = var.ec2_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.ec2"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# ec2messages
resource "aws_vpc_endpoint" "ec2messages_endpoint" {
  count = var.ec2messages_endpoint_enable ? 1 : 0

  private_dns_enabled = var.ec2messages_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.ec2messages"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# elasticloadbalancing
resource "aws_vpc_endpoint" "elasticloadbalancing_endpoint" {
  count = var.elasticloadbalancing_endpoint_enable ? 1 : 0

  private_dns_enabled = var.elasticloadbalancing_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.elasticloadbalancing"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# events
resource "aws_vpc_endpoint" "events_endpoint" {
  count = var.events_endpoint_enable ? 1 : 0

  private_dns_enabled = var.events_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.events"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# execute-api
resource "aws_vpc_endpoint" "execute_api_endpoint" {
  count = var.execute_api_endpoint_enable ? 1 : 0

  private_dns_enabled = var.execute_api_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.execute-api"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# kinesis-streams
resource "aws_vpc_endpoint" "kinesis_streams_endpoint" {
  count = var.kinesis_streams_endpoint_enable ? 1 : 0

  private_dns_enabled = var.kinesis_streams_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.kinesis-streams"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# kms
resource "aws_vpc_endpoint" "kms_endpoint" {
  count = var.kms_endpoint_enable ? 1 : 0

  private_dns_enabled = var.kms_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.kms"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# logs
resource "aws_vpc_endpoint" "logs_endpoint" {
  count = var.logs_endpoint_enable ? 1 : 0

  private_dns_enabled = var.logs_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.logs"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# monitoring
resource "aws_vpc_endpoint" "monitoring_endpoint" {
  count = var.monitoring_endpoint_enable ? 1 : 0

  private_dns_enabled = var.monitoring_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.monitoring"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# sagemaker.runtime
resource "aws_vpc_endpoint" "sagemaker_runtime_endpoint" {
  count = var.sagemaker_runtime_endpoint_enable ? 1 : 0

  private_dns_enabled = var.sagemaker_runtime_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.sagemaker.runtime"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# secretsmanager
resource "aws_vpc_endpoint" "secretsmanager_endpoint" {
  count = var.secretsmanager_endpoint_enable ? 1 : 0

  private_dns_enabled = var.secretsmanager_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.secretsmanager"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# servicecatalog
resource "aws_vpc_endpoint" "servicecatalog_endpoint" {
  count = var.servicecatalog_endpoint_enable ? 1 : 0

  private_dns_enabled = var.servicecatalog_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.servicecatalog"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# sns
resource "aws_vpc_endpoint" "sns_endpoint" {
  count = var.sns_endpoint_enable ? 1 : 0

  private_dns_enabled = var.sns_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.sns"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# sqs
resource "aws_vpc_endpoint" "sqs_endpoint" {
  count = var.sqs_endpoint_enable ? 1 : 0

  private_dns_enabled = var.sqs_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.sqs"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}

# ssm
resource "aws_vpc_endpoint" "ssm_endpoint" {
  count = var.ssm_endpoint_enable ? 1 : 0

  private_dns_enabled = var.ssm_private_dns_enable
  security_group_ids  = var.security_groups
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.ssm"
  subnet_ids          = var.subnets
  tags                = local.merged_tags
  vpc_endpoint_type   = "Interface"
  vpc_id              = var.vpc_id
}
