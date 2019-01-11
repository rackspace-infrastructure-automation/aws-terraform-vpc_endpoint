/**
 * # aws-terraform-vpc_endpoint
 *
 *This module builds VPC endpoints based on the inputs.
 *
 *## Basic Usage
 *
 *```
 * module "vpc_endpoint" {
 *   source                    = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint?ref=v0.0.4"
 *   vpc_id                    = "${module.base_network.vpc_id}"
 *   route_tables_ids_list     = "${module.base_network.private_route_tables}"
 *   dynamo_db_endpoint_enable = true
 *   s3_endpoint_enable        = true
 * }
 *```
 *
 * Full working references are available at [examples](examples)
 */

data "aws_region" "current_region" {}

resource "aws_vpc_endpoint" "s3_endpoint" {
  count             = "${var.s3_endpoint_enable ? 1 : 0}"
  vpc_id            = "${var.vpc_id}"
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${data.aws_region.current_region.name}.s3"
  route_table_ids   = ["${var.route_tables_ids_list}"]
}

resource "aws_vpc_endpoint" "dynamo_endpoint" {
  count             = "${var.dynamo_db_endpoint_enable ? 1 : 0}"
  vpc_id            = "${var.vpc_id}"
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${data.aws_region.current_region.name}.dynamodb"
  route_table_ids   = ["${var.route_tables_ids_list}"]
}

# codebuild
resource "aws_vpc_endpoint" "codebuild_endpoint" {
  count               = "${var.codebuild_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.codebuild"
  private_dns_enabled = "${var.codebuild_private_dns_enable}"
}

# codebuild-fips
resource "aws_vpc_endpoint" "codebuild-fips_endpoint" {
  count               = "${var.codebuild-fips_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.codebuild-fips"
  private_dns_enabled = "${var.codebuild-fips_private_dns_enable}"
}

# ec2
resource "aws_vpc_endpoint" "ec2_endpoint" {
  count               = "${var.ec2_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.ec2"
  private_dns_enabled = "${var.ec2_private_dns_enable}"
}

# ec2messages
resource "aws_vpc_endpoint" "ec2messages_endpoint" {
  count               = "${var.ec2messages_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.ec2messages"
  private_dns_enabled = "${var.ec2messages_private_dns_enable}"
}

# elasticloadbalancing
resource "aws_vpc_endpoint" "elasticloadbalancing_endpoint" {
  count               = "${var.elasticloadbalancing_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.elasticloadbalancing"
  private_dns_enabled = "${var.elasticloadbalancing_private_dns_enable}"
}

# events
resource "aws_vpc_endpoint" "events_endpoint" {
  count               = "${var.events_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.events"
  private_dns_enabled = "${var.events_private_dns_enable}"
}

# execute-api
resource "aws_vpc_endpoint" "execute-api_endpoint" {
  count               = "${var.execute-api_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.execute-api"
  private_dns_enabled = "${var.execute-api_private_dns_enable}"
}

# kinesis-streams
resource "aws_vpc_endpoint" "kinesis-streams_endpoint" {
  count               = "${var.kinesis-streams_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.kinesis-streams"
  private_dns_enabled = "${var.kinesis-streams_private_dns_enable}"
}

# kms
resource "aws_vpc_endpoint" "kms_endpoint" {
  count               = "${var.kms_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.kms"
  private_dns_enabled = "${var.kms_private_dns_enable}"
}

# logs
resource "aws_vpc_endpoint" "logs_endpoint" {
  count               = "${var.logs_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.logs"
  private_dns_enabled = "${var.logs_private_dns_enable}"
}

# monitoring
resource "aws_vpc_endpoint" "monitoring_endpoint" {
  count               = "${var.monitoring_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.monitoring"
  private_dns_enabled = "${var.monitoring_private_dns_enable}"
}

# sagemaker.runtime
resource "aws_vpc_endpoint" "sagemaker_runtime_endpoint" {
  count               = "${var.sagemaker_runtime_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.sagemaker.runtime"
  private_dns_enabled = "${var.sagemaker_runtime_private_dns_enable}"
}

# secretsmanager
resource "aws_vpc_endpoint" "secretsmanager_endpoint" {
  count               = "${var.secretsmanager_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.secretsmanager"
  private_dns_enabled = "${var.secretsmanager_private_dns_enable}"
}

# servicecatalog
resource "aws_vpc_endpoint" "servicecatalog_endpoint" {
  count               = "${var.servicecatalog_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.servicecatalog"
  private_dns_enabled = "${var.servicecatalog_private_dns_enable}"
}

# sns
resource "aws_vpc_endpoint" "sns_endpoint" {
  count               = "${var.sns_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.sns"
  private_dns_enabled = "${var.sns_private_dns_enable}"
}

# ssm
resource "aws_vpc_endpoint" "ssm_endpoint" {
  count               = "${var.ssm_endpoint_enable ? 1 : 0}"
  vpc_id              = "${var.vpc_id}"
  subnet_ids          = ["${var.subnet_ids_list}"]
  security_group_ids  = ["${var.security_group_ids_list}"]
  vpc_endpoint_type   = "Interface"
  service_name        = "com.amazonaws.${data.aws_region.current_region.name}.ssm"
  private_dns_enabled = "${var.ssm_private_dns_enable}"
}
