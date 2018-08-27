## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| codebuild-fips_endpoint_enable | Enable/Disable the codebuild-fips VPC Endpoint. Allowed values: true, false | string | `false` | no |
| codebuild-fips_private_dns_enable | Enable/Disable private dns on the codebuild-fips endpoint. Allowed values: true, false | string | `false` | no |
| codebuild_endpoint_enable | Enable/Disable the codebuild VPC Endpoint. Allowed values: true, false | string | `false` | no |
| codebuild_private_dns_enable | Enable/Disable private dns on the codebuild endpoint. Allowed values: true, false | string | `false` | no |
| dynamo_db_endpoint_enable | Enable/Disable the DynamoDB VPC Endpoint. Allowed values: true, false | string | `true` | no |
| ec2_endpoint_enable | Enable/Disable the ec2 VPC Endpoint. Allowed values: true, false | string | `false` | no |
| ec2_private_dns_enable | Enable/Disable private dns on the ec2 endpoint. Allowed values: true, false | string | `false` | no |
| ec2messages_endpoint_enable | Enable/Disable the ec2messages VPC Endpoint. Allowed values: true, false | string | `false` | no |
| ec2messages_private_dns_enable | Enable/Disable private dns on the ec2messages endpoint. Allowed values: true, false | string | `false` | no |
| elasticloadbalancing_endpoint_enable | Enable/Disable the elasticloadbalancing VPC Endpoint. Allowed values: true, false | string | `false` | no |
| elasticloadbalancing_private_dns_enable | Enable/Disable private dns on the elasticloadbalancing endpoint. Allowed values: true, false | string | `false` | no |
| environment | Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test') | string | `Development` | no |
| events_endpoint_enable | Enable/Disable the events VPC Endpoint. Allowed values: true, false | string | `false` | no |
| events_private_dns_enable | Enable/Disable private dns on the events endpoint. Allowed values: true, false | string | `false` | no |
| execute-api_endpoint_enable | Enable/Disable the execute-api VPC Endpoint. Allowed values: true, false | string | `false` | no |
| execute-api_private_dns_enable | Enable/Disable private dns on the execute-api endpoint. Allowed values: true, false | string | `false` | no |
| kinesis-streams_endpoint_enable | Enable/Disable the kinesis-streams VPC Endpoint. Allowed values: true, false | string | `false` | no |
| kinesis-streams_private_dns_enable | Enable/Disable private dns on the kinesis-streams endpoint. Allowed values: true, false | string | `false` | no |
| kms_endpoint_enable | Enable/Disable the kms VPC Endpoint. Allowed values: true, false | string | `false` | no |
| kms_private_dns_enable | Enable/Disable private dns on the kms endpoint. Allowed values: true, false | string | `false` | no |
| logs_endpoint_enable | Enable/Disable the logs VPC Endpoint. Allowed values: true, false | string | `false` | no |
| logs_private_dns_enable | Enable/Disable private dns on the logs endpoint. Allowed values: true, false | string | `false` | no |
| monitoring_endpoint_enable | Enable/Disable the monitoring VPC Endpoint. Allowed values: true, false | string | `false` | no |
| monitoring_private_dns_enable | Enable/Disable private dns on the monitoring endpoint. Allowed values: true, false | string | `false` | no |
| resource_name | The name to be used for resources provisioned by this module | string | - | yes |
| route_tables_ids_list | List of Route Table ID's for each AZ | list | `<list>` | no |
| s3_endpoint_enable | Enable/Disable the S3 VPC Endpoint. Allowed values: true, false | string | `true` | no |
| sagemaker_runtime_endpoint_enable | Enable/Disable the sagemaker.runtime VPC Endpoint. Allowed values: true, false | string | `false` | no |
| sagemaker_runtime_private_dns_enable | Enable/Disable private dns on the sagemaker.runtime endpoint. Allowed values: true, false | string | `false` | no |
| secretsmanager_endpoint_enable | Enable/Disable the secretsmanager VPC Endpoint. Allowed values: true, false | string | `false` | no |
| secretsmanager_private_dns_enable | Enable/Disable private dns on the secretsmanager endpoint. Allowed values: true, false | string | `false` | no |
| security_group_ids_list | List of Security Group ID's for the endpoints. | list | `<list>` | no |
| servicecatalog_endpoint_enable | Enable/Disable the servicecatalog VPC Endpoint. Allowed values: true, false | string | `false` | no |
| servicecatalog_private_dns_enable | Enable/Disable private dns on the servicecatalog endpoint. Allowed values: true, false | string | `false` | no |
| sns_endpoint_enable | Enable/Disable the sns VPC Endpoint. Allowed values: true, false | string | `false` | no |
| sns_private_dns_enable | Enable/Disable private dns on the sns endpoint. Allowed values: true, false | string | `false` | no |
| ssm_endpoint_enable | Enable/Disable the ssm VPC Endpoint. Allowed values: true, false | string | `false` | no |
| ssm_private_dns_enable | Enable/Disable private dns on the ssm endpoint. Allowed values: true, false | string | `false` | no |
| subnet_ids_list | List of Subnets to assoicate with Inteface endpoints. | list | `<list>` | no |
| vpc_id | Provide Virtual Private Cloud ID | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| codebuild-fips_vpc_endpoint_id | Codebuild-fips vpc endpoint ID |
| codebuild_vpc_endpoint_id | Codebuild vpc endpoint ID |
| dynamodb_vpc_endpoint_id | S3 vpc endpoint ID |
| ec2_vpc_endpoint_id | EC2 vpc endpoint ID |
| ec2messages_vpc_endpoint_id | EC2messages vpc endpoint ID |
| elasticloadbalancing_vpc_endpoint_id | Elasticloadbalancing vpc endpoint ID |
| events_vpc_endpoint_id | Events vpc endpoint ID |
| execute-api_vpc_endpoint_id | Execute-api vpc endpoint ID |
| kinesis-streams_vpc_endpoint_id | Kinesis-streams vpc endpoint ID |
| kms_vpc_endpoint_id | Kms vpc endpoint ID |
| logs_vpc_endpoint_id | Logs vpc endpoint ID |
| monitoring_vpc_endpoint_id | Monitoring vpc endpoint ID |
| s3_vpc_endpoint_id | S3 vpc endpoint ID |
| sagemaker_runtime_vpc_endpoint_id | Sagemaker.runtime vpc endpoint ID |
| secretsmanager_vpc_endpoint_id | Secretsmanager vpc endpoint ID |
| servicecatalog_vpc_endpoint_id | Servicecatalog vpc endpoint ID |
| sns_vpc_endpoint_id | SNS vpc endpoint ID |
| ssm_vpc_endpoint_id | SSM vpc endpoint ID |
