# aws-terraform-vpc_endpoint

This module builds VPC endpoints based on the inputs.

## Basic Usage

```HCL
module "vpc_endpoint" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_endpoint?ref=v0.0.6"

  dynamo_db_endpoint_enable = true

  route_tables_ids_list     = "${concat(
    module.base_network.private_route_tables,
    module.base_network.public_route_tables
  )}"

  s3_endpoint_enable        = true
  vpc_id                    = "${module.base_network.vpc_id}"
}
```

Full working references are available at [examples](examples)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| codebuild\_endpoint\_enable | Enable/Disable the codebuild VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| codebuild\_fips\_endpoint\_enable | Enable/Disable the codebuild-fips VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| codebuild\_fips\_private\_dns\_enable | Enable/Disable private dns on the codebuild-fips endpoint. Allowed values: true, false | string | `"false"` | no |
| codebuild\_private\_dns\_enable | Enable/Disable private dns on the codebuild endpoint. Allowed values: true, false | string | `"false"` | no |
| dynamo\_db\_endpoint\_enable | Enable/Disable the DynamoDB VPC Endpoint. Allowed values: true, false | string | `"true"` | no |
| ec2\_endpoint\_enable | Enable/Disable the ec2 VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| ec2\_private\_dns\_enable | Enable/Disable private dns on the ec2 endpoint. Allowed values: true, false | string | `"false"` | no |
| ec2messages\_endpoint\_enable | Enable/Disable the ec2messages VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| ec2messages\_private\_dns\_enable | Enable/Disable private dns on the ec2messages endpoint. Allowed values: true, false | string | `"false"` | no |
| elasticloadbalancing\_endpoint\_enable | Enable/Disable the elasticloadbalancing VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| elasticloadbalancing\_private\_dns\_enable | Enable/Disable private dns on the elasticloadbalancing endpoint. Allowed values: true, false | string | `"false"` | no |
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | string | `"Development"` | no |
| events\_endpoint\_enable | Enable/Disable the events VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| events\_private\_dns\_enable | Enable/Disable private dns on the events endpoint. Allowed values: true, false | string | `"false"` | no |
| execute\_api\_endpoint\_enable | Enable/Disable the execute-api VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| execute\_api\_private\_dns\_enable | Enable/Disable private dns on the execute-api endpoint. Allowed values: true, false | string | `"false"` | no |
| kinesis\_streams\_endpoint\_enable | Enable/Disable the kinesis-streams VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| kinesis\_streams\_private\_dns\_enable | Enable/Disable private dns on the kinesis-streams endpoint. Allowed values: true, false | string | `"false"` | no |
| kms\_endpoint\_enable | Enable/Disable the kms VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| kms\_private\_dns\_enable | Enable/Disable private dns on the kms endpoint. Allowed values: true, false | string | `"false"` | no |
| logs\_endpoint\_enable | Enable/Disable the logs VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| logs\_private\_dns\_enable | Enable/Disable private dns on the logs endpoint. Allowed values: true, false | string | `"false"` | no |
| monitoring\_endpoint\_enable | Enable/Disable the monitoring VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| monitoring\_private\_dns\_enable | Enable/Disable private dns on the monitoring endpoint. Allowed values: true, false | string | `"false"` | no |
| route\_tables\_ids\_list | List of Route Table ID's for each AZ | list | `<list>` | no |
| s3\_endpoint\_enable | Enable/Disable the S3 VPC Endpoint. Allowed values: true, false | string | `"true"` | no |
| sagemaker\_runtime\_endpoint\_enable | Enable/Disable the sagemaker.runtime VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| sagemaker\_runtime\_private\_dns\_enable | Enable/Disable private dns on the sagemaker.runtime endpoint. Allowed values: true, false | string | `"false"` | no |
| secretsmanager\_endpoint\_enable | Enable/Disable the secretsmanager VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| secretsmanager\_private\_dns\_enable | Enable/Disable private dns on the secretsmanager endpoint. Allowed values: true, false | string | `"false"` | no |
| security\_group\_ids\_list | List of Security Group ID's for the endpoints. | list | `<list>` | no |
| servicecatalog\_endpoint\_enable | Enable/Disable the servicecatalog VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| servicecatalog\_private\_dns\_enable | Enable/Disable private dns on the servicecatalog endpoint. Allowed values: true, false | string | `"false"` | no |
| sns\_endpoint\_enable | Enable/Disable the sns VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| sns\_private\_dns\_enable | Enable/Disable private dns on the sns endpoint. Allowed values: true, false | string | `"false"` | no |
| sqs\_endpoint\_enable | Enable/Disable the sqs VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| sqs\_private\_dns\_enable | Enable/Disable private dns on the sqs endpoint. Allowed values: true, false | string | `"false"` | no |
| ssm\_endpoint\_enable | Enable/Disable the ssm VPC Endpoint. Allowed values: true, false | string | `"false"` | no |
| ssm\_private\_dns\_enable | Enable/Disable private dns on the ssm endpoint. Allowed values: true, false | string | `"false"` | no |
| subnet\_ids\_list | List of Subnets to assoicate with Inteface endpoints. | list | `<list>` | no |
| tags | Custom tags to apply to all resources. | map | `<map>` | no |
| vpc\_id | Provide Virtual Private Cloud ID | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| codebuild\_fips\_vpc\_endpoint\_id | CodeBuild-fips VPC endpoint ID |
| codebuild\_vpc\_endpoint\_id | CodeBuild VPC endpoint ID |
| dynamodb\_vpc\_endpoint\_id | DynamoDB VPC endpoint ID |
| ec2\_vpc\_endpoint\_id | EC2 VPC endpoint ID |
| ec2messages\_vpc\_endpoint\_id | EC2messages VPC endpoint ID |
| elasticloadbalancing\_vpc\_endpoint\_id | Elasticloadbalancing VPC endpoint ID |
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

