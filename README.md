# aws-terraform-vpc\_endpoint

This module builds VPC endpoints based on the inputs.

## Basic Usage

### New Style (uses `for_each` resource parameter)

```HCL
module "vpc_endpoint" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint?ref=v0.12.2"

  dynamo_db_endpoint_enable = false
  enable_private_dns_list   = ["codebuild", "ec2", "ec2messages", "elasticloadbalancing", "events", "kms", "logs", "monitoring", "sagemaker.runtime", "secretsmanager", "servicecatalog", "sns", "sqs", "ssm"]
  gateway_endpoints         = ["s3", "dynamodb"]
  interface_endpoints       = ["codebuild", "ec2", "ec2messages", "elasticloadbalancing", "events", "execute-api", "kinesis-streams", "kms", "logs", "monitoring", "sagemaker.runtime", "secretsmanager", "servicecatalog", "sns", "sqs", "ssm"]
  security_groups           = [module.security_groups.vpc_endpoint_security_group_id]
  subnets                   = module.base_network.private_subnets
  s3_endpoint_enable        = false
  vpc_id                    = module.base_network.vpc_id

 route_tables = concat(
    module.base_network.private_route_tables,
    module.base_network.public_route_tables,
 )
}
```

### Legacy (uses boolean toggles per endpoint)

```HCL
module "vpc_endpoint" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint?ref=v0.12.2"

  dynamo_db_endpoint_enable = true
  s3_endpoint_enable        = true
  vpc_id                    = "${module.base_network.vpc_id}"

  route_tables = concat(
    module.base_network.private_route_tables,
    module.base_network.public_route_tables
  )
}
```

Full working references are available at [examples](examples)

## Terraform 0.12 upgrade

Several changes were required while adding terraform 0.12 compatibility.  The following changes should be  
made when upgrading from a previous release to version 0.12.0 or higher.

### Module variables

The following module variables were updated to better meet current Rackspace style guides:

- `route_tables_ids_list` -> `route_tables`
- `security_group_ids_list` -> `security_groups`
- `subnet_ids_list` -> `subnets`

From version 0.12.1, the following changes have occurred:
#### Deprecations
- All of the boolean "enable" variables such as `events_endpoint_enable` and `events_private_dns_enable` are marked for deprecation to accomodate a more compact and Terraform 0.12 friendly configuration. They will be removed in a future release. In lieu of these, please see the Additions section.

#### Additions
- `gateway_endpoints` - introduced as a single variable to replace all "enable" Gatway booleans. It is a list of gateway servicenames.
- `interface_endpoints` - introduced as a single variable to replace all "enable" Interface booleans. It is a list of interface servicenames.
- `enable_private_dns_list` - introduced as a single variable to replace all of the "enable" Private DNS Interface booleans.  It is a list of interface servicenames.

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.7.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| codebuild\_endpoint\_enable | Enable/Disable the codebuild VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| codebuild\_fips\_endpoint\_enable | Enable/Disable the codebuild-fips VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| codebuild\_fips\_private\_dns\_enable | Enable/Disable private dns on the codebuild-fips endpoint. Allowed values: true, false | `bool` | `false` | no |
| codebuild\_private\_dns\_enable | Enable/Disable private dns on the codebuild endpoint. Allowed values: true, false | `bool` | `false` | no |
| dynamo\_db\_endpoint\_enable | Enable/Disable the DynamoDB VPC Endpoint. Allowed values: true, false | `bool` | `true` | no |
| ec2\_endpoint\_enable | Enable/Disable the ec2 VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| ec2\_private\_dns\_enable | Enable/Disable private dns on the ec2 endpoint. Allowed values: true, false | `bool` | `false` | no |
| ec2messages\_endpoint\_enable | Enable/Disable the ec2messages VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| ec2messages\_private\_dns\_enable | Enable/Disable private dns on the ec2messages endpoint. Allowed values: true, false | `bool` | `false` | no |
| ecr\_api\_endpoint\_enable | Enable/Disable the ecr.api VPC endpoint. Allowed values: true, false | `bool` | `false` | no |
| ecr\_api\_private\_dns\_enable | Enable/Disable private dns on the ecr.api endpoint. Allowed values: true, false | `bool` | `false` | no |
| ecr\_dkr\_endpoint\_enable | Enable/Disable the ecr.dkr endpoint. Allowed values: true, false | `bool` | `false` | no |
| ecr\_dkr\_private\_dns\_enable | Enable/Disable private dns on the ecr.dkr endpoint. Allowed values: true, false | `bool` | `false` | no |
| elasticloadbalancing\_endpoint\_enable | Enable/Disable the elasticloadbalancing VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| elasticloadbalancing\_private\_dns\_enable | Enable/Disable private dns on the elasticloadbalancing endpoint. Allowed values: true, false | `bool` | `false` | no |
| enable\_private\_dns\_list | List of Interface endpoints that should have private DNS enabled.  This should be a subset of the list for interface endpoints to provision. | `list(string)` | `[]` | no |
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | `string` | `"Development"` | no |
| events\_endpoint\_enable | Enable/Disable the events VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| events\_private\_dns\_enable | Enable/Disable private dns on the events endpoint. Allowed values: true, false | `bool` | `false` | no |
| execute\_api\_endpoint\_enable | Enable/Disable the execute-api VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| execute\_api\_private\_dns\_enable | Enable/Disable private dns on the execute-api endpoint. Allowed values: true, false | `bool` | `false` | no |
| gateway\_endpoints | List of gateway endpoints to enable. e.g. `["dynamodb","s3"]`. The complete list can be found here: https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html . To date only `s3` and `dynamodb` exist. Also note for backward compatibiity, `s3_endpoint_enable` and `dynamo_db_endpoint_enable` default to `true` so if using this method, those need to be explicitly set to `false`. | `list(string)` | `[]` | no |
| interface\_endpoints | List of interface endpoints to enable. e.g. `["codebuild","ec2"]`. The complete list can be found here: https://docs.aws.amazon.com/vpc/latest/userguide/vpce-interface.html. | `list(string)` | `[]` | no |
| kinesis\_streams\_endpoint\_enable | Enable/Disable the kinesis-streams VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| kinesis\_streams\_private\_dns\_enable | Enable/Disable private dns on the kinesis-streams endpoint. Allowed values: true, false | `bool` | `false` | no |
| kms\_endpoint\_enable | Enable/Disable the kms VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| kms\_private\_dns\_enable | Enable/Disable private dns on the kms endpoint. Allowed values: true, false | `bool` | `false` | no |
| logs\_endpoint\_enable | Enable/Disable the logs VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| logs\_private\_dns\_enable | Enable/Disable private dns on the logs endpoint. Allowed values: true, false | `bool` | `false` | no |
| monitoring\_endpoint\_enable | Enable/Disable the monitoring VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| monitoring\_private\_dns\_enable | Enable/Disable private dns on the monitoring endpoint. Allowed values: true, false | `bool` | `false` | no |
| route\_tables | List of Route Table ID's for each AZ | `list(string)` | `[]` | no |
| s3\_endpoint\_enable | Enable/Disable the S3 VPC Endpoint. Allowed values: true, false | `bool` | `true` | no |
| sagemaker\_runtime\_endpoint\_enable | Enable/Disable the sagemaker.runtime VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| sagemaker\_runtime\_private\_dns\_enable | Enable/Disable private dns on the sagemaker.runtime endpoint. Allowed values: true, false | `bool` | `false` | no |
| secretsmanager\_endpoint\_enable | Enable/Disable the secretsmanager VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| secretsmanager\_private\_dns\_enable | Enable/Disable private dns on the secretsmanager endpoint. Allowed values: true, false | `bool` | `false` | no |
| security\_groups | List of Security Group ID's for the endpoints. | `list(string)` | `[]` | no |
| servicecatalog\_endpoint\_enable | Enable/Disable the servicecatalog VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| servicecatalog\_private\_dns\_enable | Enable/Disable private dns on the servicecatalog endpoint. Allowed values: true, false | `bool` | `false` | no |
| sns\_endpoint\_enable | Enable/Disable the sns VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| sns\_private\_dns\_enable | Enable/Disable private dns on the sns endpoint. Allowed values: true, false | `bool` | `false` | no |
| sqs\_endpoint\_enable | Enable/Disable the sqs VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| sqs\_private\_dns\_enable | Enable/Disable private dns on the sqs endpoint. Allowed values: true, false | `bool` | `false` | no |
| ssm\_endpoint\_enable | Enable/Disable the ssm VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| ssm\_private\_dns\_enable | Enable/Disable private dns on the ssm endpoint. Allowed values: true, false | `bool` | `false` | no |
| subnets | List of Subnets to assoicate with Inteface endpoints. | `list(string)` | `[]` | no |
| tags | Custom tags to apply to all resources. | `map(string)` | `{}` | no |
| vpc\_id | Provide Virtual Private Cloud ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| codebuild\_fips\_vpc\_endpoint\_id | CodeBuild-fips VPC endpoint ID |
| codebuild\_vpc\_endpoint\_id | CodeBuild VPC endpoint ID |
| dynamodb\_vpc\_endpoint\_id | DynamoDB VPC endpoint ID |
| ec2\_vpc\_endpoint\_id | EC2 VPC endpoint ID |
| ec2messages\_vpc\_endpoint\_id | EC2messages VPC endpoint ID |
| ecr\_api\_vpc\_endpoint\_id | ecr.api VPC endpoint ID |
| ecr\_dkr\_vpc\_endpoint\_id | ecr.dkr VPC endpoint ID |
| elasticloadbalancing\_vpc\_endpoint\_id | Elasticloadbalancing VPC endpoint ID |
| endpoint\_ids | Combined List of gateWay and Interface IDs |
| events\_vpc\_endpoint\_id | Events VPC endpoint ID |
| execute\_api\_vpc\_endpoint\_id | Execute-api VPC endpoint ID |
| kinesis\_streams\_vpc\_endpoint\_id | Kinesis-streams VPC endpoint ID |
| kms\_vpc\_endpoint\_id | Kms VPC endpoint ID |
| logs\_vpc\_endpoint\_id | Logs VPC endpoint ID |
| monitoring\_vpc\_endpoint\_id | Monitoring VPC endpoint ID |
| s3\_vpc\_endpoint\_id | S3 VPC endpoint ID |
| sagemaker\_runtime\_vpc\_endpoint\_id | Sagemaker.runtime VPC endpoint ID |
| secretsmanager\_vpc\_endpoint\_id | Secretsmanager VPC endpoint ID |
| servicecatalog\_vpc\_endpoint\_id | Servicecatalog VPC endpoint ID |
| sns\_vpc\_endpoint\_id | SNS VPC endpoint ID |
| sqs\_vpc\_endpoint\_id | SQS VPC endpoint ID |
| ssm\_vpc\_endpoint\_id | SSM VPC endpoint ID |

