terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 3.0"
  region  = "us-west-2"
}

provider "random" {
  version = "~> 2.0"
}

locals {
  tags = {
    Environment     = "Test"
    Identifier      = random_string.identifier.result
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
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=v0.12.1"

  name = "VPC1-Endpoint-${random_string.identifier.result}"
}

module "base_network_2" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=v0.12.1"

  name = "VPC2-Endpoint-${random_string.identifier.result}"
}

module "base_network_3" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=v0.12.1"

  name = "VPC3-Endpoint-${random_string.identifier.result}"
}

resource "aws_security_group" "vpc_endpoint" {
  description = "VPC1 Endpoint Security Group"
  name_prefix = "${random_string.identifier.result}-VpcEndpointSecurityGroup-1"
  vpc_id      = module.base_network.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }

  tags = merge(
    local.tags,
    {
      "Name" = "${random_string.identifier.result}-VpcEndpointSecurityGroup-1"
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "vpc_endpoint_2" {
  description = "VPC2 Endpoint Security Group"
  name_prefix = "${random_string.identifier.result}-VpcEndpointSecurityGroup-2"
  vpc_id      = module.base_network_2.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }

  tags = merge(
    local.tags,
    {
      "Name" = "${random_string.identifier.result}-VpcEndpointSecurityGroup-2"
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "vpc_endpoint_3" {
  description = "VPC3 Endpoint Security Group"
  name_prefix = "${random_string.identifier.result}-VpcEndpointSecurityGroup-3"
  vpc_id      = module.base_network_3.vpc_id

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }

  tags = merge(
    local.tags,
    {
      "Name" = "${random_string.identifier.result}-VpcEndpointSecurityGroup-3"
    },
  )

  lifecycle {
    create_before_destroy = true
  }
}

#legacy
module "vpc_endpoint" {
  source = "../../module"

  codebuild_endpoint_enable               = true
  codebuild_fips_endpoint_enable          = false
  codebuild_fips_private_dns_enable       = false
  codebuild_private_dns_enable            = true
  dynamo_db_endpoint_enable               = true
  ec2_endpoint_enable                     = true
  ec2_private_dns_enable                  = true
  ec2messages_endpoint_enable             = true
  ec2messages_private_dns_enable          = true
  ecr_api_endpoint_enable                 = true
  ecr_api_private_dns_enable              = true
  ecr_dkr_endpoint_enable                 = true
  ecr_dkr_private_dns_enable              = true
  elasticloadbalancing_endpoint_enable    = true
  elasticloadbalancing_private_dns_enable = true
  environment                             = local.tags["Environment"]
  events_endpoint_enable                  = true
  events_private_dns_enable               = true
  execute_api_endpoint_enable             = true
  execute_api_private_dns_enable          = false
  kinesis_streams_endpoint_enable         = true
  kinesis_streams_private_dns_enable      = false
  kms_endpoint_enable                     = true
  kms_private_dns_enable                  = true
  logs_endpoint_enable                    = true
  logs_private_dns_enable                 = true
  monitoring_endpoint_enable              = true
  monitoring_private_dns_enable           = true
  route_tables                            = module.base_network.private_route_tables
  s3_endpoint_enable                      = true
  sagemaker_runtime_endpoint_enable       = true
  sagemaker_runtime_private_dns_enable    = true
  secretsmanager_endpoint_enable          = true
  secretsmanager_private_dns_enable       = true
  security_groups                         = [aws_security_group.vpc_endpoint.id]
  servicecatalog_endpoint_enable          = true
  servicecatalog_private_dns_enable       = true
  sns_endpoint_enable                     = true
  sns_private_dns_enable                  = true
  sqs_endpoint_enable                     = true
  sqs_private_dns_enable                  = true
  ssm_endpoint_enable                     = true
  ssm_private_dns_enable                  = true
  subnets                                 = module.base_network.private_subnets
  tags                                    = local.tags
  vpc_id                                  = module.base_network.vpc_id
}

# new style implementation
module "vpc_endpoint_2" {
  source = "../../module"

  dynamo_db_endpoint_enable = false
  enable_private_dns_list   = ["codebuild", "ec2", "ec2messages", "ecr.api", "ecr.dkr", "elasticloadbalancing", "events", "kms", "logs", "monitoring", "sagemaker.runtime", "secretsmanager", "servicecatalog", "sns", "sqs", "ssm"]
  environment               = local.tags["Environment"]
  gateway_endpoints         = ["s3", "dynamodb"]
  interface_endpoints       = ["codebuild", "ec2", "ec2messages", "elasticloadbalancing", "ecr.api", "ecr.dkr", "events", "execute-api", "kinesis-streams", "kms", "logs", "monitoring", "sagemaker.runtime", "secretsmanager", "servicecatalog", "sns", "sqs", "ssm"]
  route_tables              = module.base_network_2.private_route_tables
  s3_endpoint_enable        = false
  security_groups           = [aws_security_group.vpc_endpoint_2.id]
  subnets                   = module.base_network_2.private_subnets
  tags                      = local.tags
  vpc_id                    = module.base_network_2.vpc_id
}

# added a simple gateway endpoint
module "vpc_endpoint_3" {
  source = "../../module"

  dynamo_db_endpoint_enable = false
  environment               = local.tags["Environment"]
  gateway_endpoints         = ["s3", "dynamodb"]
  s3_endpoint_enable        = false
  tags                      = local.tags
  vpc_id                    = module.base_network_3.vpc_id

  route_tables = concat(
    module.base_network_3.private_route_tables,
    module.base_network_3.public_route_tables
  )
}
