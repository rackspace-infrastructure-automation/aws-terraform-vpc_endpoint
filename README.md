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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc_endpoint.codebuild_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.codebuild_fips_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.dynamo_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ec2_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ec2messages_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ecr_api_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ecr_dkr_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.elasticloadbalancing_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.events_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.execute_api_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.interface](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.kinesis_streams_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.kms_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.logs_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.monitoring_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.s3_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.sagemaker_runtime_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.secretsmanager_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.servicecatalog_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.sns_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.sqs_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint.ssm_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_region.current_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codebuild_endpoint_enable"></a> [codebuild\_endpoint\_enable](#input\_codebuild\_endpoint\_enable) | Enable/Disable the codebuild VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_codebuild_fips_endpoint_enable"></a> [codebuild\_fips\_endpoint\_enable](#input\_codebuild\_fips\_endpoint\_enable) | Enable/Disable the codebuild-fips VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_codebuild_fips_private_dns_enable"></a> [codebuild\_fips\_private\_dns\_enable](#input\_codebuild\_fips\_private\_dns\_enable) | Enable/Disable private dns on the codebuild-fips endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_codebuild_private_dns_enable"></a> [codebuild\_private\_dns\_enable](#input\_codebuild\_private\_dns\_enable) | Enable/Disable private dns on the codebuild endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_dynamo_db_endpoint_enable"></a> [dynamo\_db\_endpoint\_enable](#input\_dynamo\_db\_endpoint\_enable) | Enable/Disable the DynamoDB VPC Endpoint. Allowed values: true, false | `bool` | `true` | no |
| <a name="input_ec2_endpoint_enable"></a> [ec2\_endpoint\_enable](#input\_ec2\_endpoint\_enable) | Enable/Disable the ec2 VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ec2_private_dns_enable"></a> [ec2\_private\_dns\_enable](#input\_ec2\_private\_dns\_enable) | Enable/Disable private dns on the ec2 endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ec2messages_endpoint_enable"></a> [ec2messages\_endpoint\_enable](#input\_ec2messages\_endpoint\_enable) | Enable/Disable the ec2messages VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ec2messages_private_dns_enable"></a> [ec2messages\_private\_dns\_enable](#input\_ec2messages\_private\_dns\_enable) | Enable/Disable private dns on the ec2messages endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ecr_api_endpoint_enable"></a> [ecr\_api\_endpoint\_enable](#input\_ecr\_api\_endpoint\_enable) | Enable/Disable the ecr.api VPC endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ecr_api_private_dns_enable"></a> [ecr\_api\_private\_dns\_enable](#input\_ecr\_api\_private\_dns\_enable) | Enable/Disable private dns on the ecr.api endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ecr_dkr_endpoint_enable"></a> [ecr\_dkr\_endpoint\_enable](#input\_ecr\_dkr\_endpoint\_enable) | Enable/Disable the ecr.dkr endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ecr_dkr_private_dns_enable"></a> [ecr\_dkr\_private\_dns\_enable](#input\_ecr\_dkr\_private\_dns\_enable) | Enable/Disable private dns on the ecr.dkr endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_elasticloadbalancing_endpoint_enable"></a> [elasticloadbalancing\_endpoint\_enable](#input\_elasticloadbalancing\_endpoint\_enable) | Enable/Disable the elasticloadbalancing VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_elasticloadbalancing_private_dns_enable"></a> [elasticloadbalancing\_private\_dns\_enable](#input\_elasticloadbalancing\_private\_dns\_enable) | Enable/Disable private dns on the elasticloadbalancing endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_enable_private_dns_list"></a> [enable\_private\_dns\_list](#input\_enable\_private\_dns\_list) | List of Interface endpoints that should have private DNS enabled.  This should be a subset of the list for interface endpoints to provision. | `list(string)` | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | `string` | `"Development"` | no |
| <a name="input_events_endpoint_enable"></a> [events\_endpoint\_enable](#input\_events\_endpoint\_enable) | Enable/Disable the events VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_events_private_dns_enable"></a> [events\_private\_dns\_enable](#input\_events\_private\_dns\_enable) | Enable/Disable private dns on the events endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_execute_api_endpoint_enable"></a> [execute\_api\_endpoint\_enable](#input\_execute\_api\_endpoint\_enable) | Enable/Disable the execute-api VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_execute_api_private_dns_enable"></a> [execute\_api\_private\_dns\_enable](#input\_execute\_api\_private\_dns\_enable) | Enable/Disable private dns on the execute-api endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_gateway_endpoints"></a> [gateway\_endpoints](#input\_gateway\_endpoints) | List of gateway endpoints to enable. e.g. `["dynamodb","s3"]`. The complete list can be found here: https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html . To date only `s3` and `dynamodb` exist. Also note for backward compatibiity, `s3_endpoint_enable` and `dynamo_db_endpoint_enable` default to `true` so if using this method, those need to be explicitly set to `false`. | `list(string)` | `[]` | no |
| <a name="input_interface_endpoints"></a> [interface\_endpoints](#input\_interface\_endpoints) | List of interface endpoints to enable. e.g. `["codebuild","ec2"]`. The complete list can be found here: https://docs.aws.amazon.com/vpc/latest/userguide/vpce-interface.html. | `list(string)` | `[]` | no |
| <a name="input_kinesis_streams_endpoint_enable"></a> [kinesis\_streams\_endpoint\_enable](#input\_kinesis\_streams\_endpoint\_enable) | Enable/Disable the kinesis-streams VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_kinesis_streams_private_dns_enable"></a> [kinesis\_streams\_private\_dns\_enable](#input\_kinesis\_streams\_private\_dns\_enable) | Enable/Disable private dns on the kinesis-streams endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_kms_endpoint_enable"></a> [kms\_endpoint\_enable](#input\_kms\_endpoint\_enable) | Enable/Disable the kms VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_kms_private_dns_enable"></a> [kms\_private\_dns\_enable](#input\_kms\_private\_dns\_enable) | Enable/Disable private dns on the kms endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_logs_endpoint_enable"></a> [logs\_endpoint\_enable](#input\_logs\_endpoint\_enable) | Enable/Disable the logs VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_logs_private_dns_enable"></a> [logs\_private\_dns\_enable](#input\_logs\_private\_dns\_enable) | Enable/Disable private dns on the logs endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_monitoring_endpoint_enable"></a> [monitoring\_endpoint\_enable](#input\_monitoring\_endpoint\_enable) | Enable/Disable the monitoring VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_monitoring_private_dns_enable"></a> [monitoring\_private\_dns\_enable](#input\_monitoring\_private\_dns\_enable) | Enable/Disable private dns on the monitoring endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_route_tables"></a> [route\_tables](#input\_route\_tables) | List of Route Table ID's for each AZ | `list(string)` | `[]` | no |
| <a name="input_s3_endpoint_enable"></a> [s3\_endpoint\_enable](#input\_s3\_endpoint\_enable) | Enable/Disable the S3 VPC Endpoint. Allowed values: true, false | `bool` | `true` | no |
| <a name="input_s3_endpoint_policy_text"></a> [s3\_endpoint\_policy\_text](#input\_s3\_endpoint\_policy\_text) | The JSON S3 Endpoint policy text to apply to the VPC Endpoint. The length must be between 100 and 10,240 characters. Default is allow everyone all access to every S3 Bucket | `string` | `"{\n  \"Statement\": [\n      {\n          \"Action\": \"*\",\n          \"Effect\": \"Allow\",\n          \"Resource\": \"*\",\n          \"Principal\": \"*\"\n      }\n  ]\n}\n"` | no |
| <a name="input_sagemaker_runtime_endpoint_enable"></a> [sagemaker\_runtime\_endpoint\_enable](#input\_sagemaker\_runtime\_endpoint\_enable) | Enable/Disable the sagemaker.runtime VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_sagemaker_runtime_private_dns_enable"></a> [sagemaker\_runtime\_private\_dns\_enable](#input\_sagemaker\_runtime\_private\_dns\_enable) | Enable/Disable private dns on the sagemaker.runtime endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_secretsmanager_endpoint_enable"></a> [secretsmanager\_endpoint\_enable](#input\_secretsmanager\_endpoint\_enable) | Enable/Disable the secretsmanager VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_secretsmanager_private_dns_enable"></a> [secretsmanager\_private\_dns\_enable](#input\_secretsmanager\_private\_dns\_enable) | Enable/Disable private dns on the secretsmanager endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of Security Group ID's for the endpoints. | `list(string)` | `[]` | no |
| <a name="input_servicecatalog_endpoint_enable"></a> [servicecatalog\_endpoint\_enable](#input\_servicecatalog\_endpoint\_enable) | Enable/Disable the servicecatalog VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_servicecatalog_private_dns_enable"></a> [servicecatalog\_private\_dns\_enable](#input\_servicecatalog\_private\_dns\_enable) | Enable/Disable private dns on the servicecatalog endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_sns_endpoint_enable"></a> [sns\_endpoint\_enable](#input\_sns\_endpoint\_enable) | Enable/Disable the sns VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_sns_private_dns_enable"></a> [sns\_private\_dns\_enable](#input\_sns\_private\_dns\_enable) | Enable/Disable private dns on the sns endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_sqs_endpoint_enable"></a> [sqs\_endpoint\_enable](#input\_sqs\_endpoint\_enable) | Enable/Disable the sqs VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_sqs_private_dns_enable"></a> [sqs\_private\_dns\_enable](#input\_sqs\_private\_dns\_enable) | Enable/Disable private dns on the sqs endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ssm_endpoint_enable"></a> [ssm\_endpoint\_enable](#input\_ssm\_endpoint\_enable) | Enable/Disable the ssm VPC Endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_ssm_private_dns_enable"></a> [ssm\_private\_dns\_enable](#input\_ssm\_private\_dns\_enable) | Enable/Disable private dns on the ssm endpoint. Allowed values: true, false | `bool` | `false` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of Subnets to assoicate with Inteface endpoints. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Custom tags to apply to all resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Provide Virtual Private Cloud ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codebuild_fips_vpc_endpoint_id"></a> [codebuild\_fips\_vpc\_endpoint\_id](#output\_codebuild\_fips\_vpc\_endpoint\_id) | CodeBuild-fips VPC endpoint ID |
| <a name="output_codebuild_vpc_endpoint_id"></a> [codebuild\_vpc\_endpoint\_id](#output\_codebuild\_vpc\_endpoint\_id) | CodeBuild VPC endpoint ID |
| <a name="output_dynamodb_vpc_endpoint_id"></a> [dynamodb\_vpc\_endpoint\_id](#output\_dynamodb\_vpc\_endpoint\_id) | DynamoDB VPC endpoint ID |
| <a name="output_ec2_vpc_endpoint_id"></a> [ec2\_vpc\_endpoint\_id](#output\_ec2\_vpc\_endpoint\_id) | EC2 VPC endpoint ID |
| <a name="output_ec2messages_vpc_endpoint_id"></a> [ec2messages\_vpc\_endpoint\_id](#output\_ec2messages\_vpc\_endpoint\_id) | EC2messages VPC endpoint ID |
| <a name="output_ecr_api_vpc_endpoint_id"></a> [ecr\_api\_vpc\_endpoint\_id](#output\_ecr\_api\_vpc\_endpoint\_id) | ecr.api VPC endpoint ID |
| <a name="output_ecr_dkr_vpc_endpoint_id"></a> [ecr\_dkr\_vpc\_endpoint\_id](#output\_ecr\_dkr\_vpc\_endpoint\_id) | ecr.dkr VPC endpoint ID |
| <a name="output_elasticloadbalancing_vpc_endpoint_id"></a> [elasticloadbalancing\_vpc\_endpoint\_id](#output\_elasticloadbalancing\_vpc\_endpoint\_id) | Elasticloadbalancing VPC endpoint ID |
| <a name="output_endpoint_ids"></a> [endpoint\_ids](#output\_endpoint\_ids) | Combined List of gateWay and Interface IDs |
| <a name="output_events_vpc_endpoint_id"></a> [events\_vpc\_endpoint\_id](#output\_events\_vpc\_endpoint\_id) | Events VPC endpoint ID |
| <a name="output_execute_api_vpc_endpoint_id"></a> [execute\_api\_vpc\_endpoint\_id](#output\_execute\_api\_vpc\_endpoint\_id) | Execute-api VPC endpoint ID |
| <a name="output_kinesis_streams_vpc_endpoint_id"></a> [kinesis\_streams\_vpc\_endpoint\_id](#output\_kinesis\_streams\_vpc\_endpoint\_id) | Kinesis-streams VPC endpoint ID |
| <a name="output_kms_vpc_endpoint_id"></a> [kms\_vpc\_endpoint\_id](#output\_kms\_vpc\_endpoint\_id) | Kms VPC endpoint ID |
| <a name="output_logs_vpc_endpoint_id"></a> [logs\_vpc\_endpoint\_id](#output\_logs\_vpc\_endpoint\_id) | Logs VPC endpoint ID |
| <a name="output_monitoring_vpc_endpoint_id"></a> [monitoring\_vpc\_endpoint\_id](#output\_monitoring\_vpc\_endpoint\_id) | Monitoring VPC endpoint ID |
| <a name="output_s3_vpc_endpoint_id"></a> [s3\_vpc\_endpoint\_id](#output\_s3\_vpc\_endpoint\_id) | S3 VPC endpoint ID |
| <a name="output_sagemaker_runtime_vpc_endpoint_id"></a> [sagemaker\_runtime\_vpc\_endpoint\_id](#output\_sagemaker\_runtime\_vpc\_endpoint\_id) | Sagemaker.runtime VPC endpoint ID |
| <a name="output_secretsmanager_vpc_endpoint_id"></a> [secretsmanager\_vpc\_endpoint\_id](#output\_secretsmanager\_vpc\_endpoint\_id) | Secretsmanager VPC endpoint ID |
| <a name="output_servicecatalog_vpc_endpoint_id"></a> [servicecatalog\_vpc\_endpoint\_id](#output\_servicecatalog\_vpc\_endpoint\_id) | Servicecatalog VPC endpoint ID |
| <a name="output_sns_vpc_endpoint_id"></a> [sns\_vpc\_endpoint\_id](#output\_sns\_vpc\_endpoint\_id) | SNS VPC endpoint ID |
| <a name="output_sqs_vpc_endpoint_id"></a> [sqs\_vpc\_endpoint\_id](#output\_sqs\_vpc\_endpoint\_id) | SQS VPC endpoint ID |
| <a name="output_ssm_vpc_endpoint_id"></a> [ssm\_vpc\_endpoint\_id](#output\_ssm\_vpc\_endpoint\_id) | SSM VPC endpoint ID |
