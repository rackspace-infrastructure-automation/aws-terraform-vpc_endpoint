
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| dynamo_db_endpoint_enable | Enable/Disable the DynamoDB VPC Endpoint. Allowed values: true, false | string | `true` | no |
| resource_name | The name to be used for resources provisioned by this module | string | - | yes |
| route_tables_ids_list | List of Route Table ID's for each AZ | list | `<list>` | no |
| s3_endpoint_enable | Enable/Disable the S3 VPC Endpoint. Allowed values: true, false | string | `true` | no |
| vpc_id | Provide Virtual Private Cloud ID | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| dynamodb_vpc_endpoint_id | S3 vpc endpoint ID |
| s3_vpc_endpoint_id | S3 vpc endpoint ID |

