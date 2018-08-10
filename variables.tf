variable "resource_name" {
  description = "The name to be used for resources provisioned by this module"
  type        = "string"
}

variable "route_tables_ids_list" {
  description = "List of Route Table ID's for each AZ"
  type        = "list"
  default     = []
}

variable "dynamo_db_endpoint_enable" {
  description = "Enable/Disable the DynamoDB VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = true
}

variable "vpc_id" {
  description = "Provide Virtual Private Cloud ID"
  type        = "string"
}

variable "s3_endpoint_enable" {
  description = "Enable/Disable the S3 VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = true
}
