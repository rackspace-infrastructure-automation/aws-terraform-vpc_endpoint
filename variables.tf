variable "environment" {
  description = "Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test')"
  type        = "string"
  default     = "Development"
}

variable "vpc_id" {
  description = "Provide Virtual Private Cloud ID"
  type        = "string"
}

variable "subnet_ids_list" {
  description = "List of Subnets to assoicate with Inteface endpoints."
  type        = "list"
  default     = []
}

variable "route_tables_ids_list" {
  description = "List of Route Table ID's for each AZ"
  type        = "list"
  default     = []
}

variable "security_group_ids_list" {
  description = "List of Security Group ID's for the endpoints."
  type        = "list"
  default     = []
}

variable "tags" {
  description = "Custom tags to apply to all resources."
  type        = "map"
  default     = {}
}

#####################
# Gateway Endpoints #
#####################

variable "dynamo_db_endpoint_enable" {
  description = "Enable/Disable the DynamoDB VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = true
}

variable "s3_endpoint_enable" {
  description = "Enable/Disable the S3 VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = true
}

#######################
# Interface Endpoints #
#######################

# codebuild
variable "codebuild_endpoint_enable" {
  description = "Enable/Disable the codebuild VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "codebuild_private_dns_enable" {
  description = "Enable/Disable private dns on the codebuild endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# codebuild-fips
# codebuild-fips is only available in us-east-1, us-east-2, us-west-1 and us-west-2.
# So we have set it to be disabled by default until such time it's available everywhere.
# https://docs.aws.amazon.com/general/latest/gr/rande.html#codebuild_region
variable "codebuild_fips_endpoint_enable" {
  description = "Enable/Disable the codebuild-fips VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "codebuild_fips_private_dns_enable" {
  description = "Enable/Disable private dns on the codebuild-fips endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# ec2
variable "ec2_endpoint_enable" {
  description = "Enable/Disable the ec2 VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "ec2_private_dns_enable" {
  description = "Enable/Disable private dns on the ec2 endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# ec2messages
variable "ec2messages_endpoint_enable" {
  description = "Enable/Disable the ec2messages VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "ec2messages_private_dns_enable" {
  description = "Enable/Disable private dns on the ec2messages endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# elasticloadbalancing
variable "elasticloadbalancing_endpoint_enable" {
  description = "Enable/Disable the elasticloadbalancing VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "elasticloadbalancing_private_dns_enable" {
  description = "Enable/Disable private dns on the elasticloadbalancing endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# events
variable "events_endpoint_enable" {
  description = "Enable/Disable the events VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "events_private_dns_enable" {
  description = "Enable/Disable private dns on the events endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# execute-api
variable "execute_api_endpoint_enable" {
  description = "Enable/Disable the execute-api VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "execute_api_private_dns_enable" {
  description = "Enable/Disable private dns on the execute-api endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# kinesis-streams
variable "kinesis_streams_endpoint_enable" {
  description = "Enable/Disable the kinesis-streams VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "kinesis_streams_private_dns_enable" {
  description = "Enable/Disable private dns on the kinesis-streams endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# kms
variable "kms_endpoint_enable" {
  description = "Enable/Disable the kms VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "kms_private_dns_enable" {
  description = "Enable/Disable private dns on the kms endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# logs
variable "logs_endpoint_enable" {
  description = "Enable/Disable the logs VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "logs_private_dns_enable" {
  description = "Enable/Disable private dns on the logs endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# monitoring
variable "monitoring_endpoint_enable" {
  description = "Enable/Disable the monitoring VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "monitoring_private_dns_enable" {
  description = "Enable/Disable private dns on the monitoring endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# sagemaker.runtime
variable "sagemaker_runtime_endpoint_enable" {
  description = "Enable/Disable the sagemaker.runtime VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "sagemaker_runtime_private_dns_enable" {
  description = "Enable/Disable private dns on the sagemaker.runtime endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# secretsmanager
variable "secretsmanager_endpoint_enable" {
  description = "Enable/Disable the secretsmanager VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "secretsmanager_private_dns_enable" {
  description = "Enable/Disable private dns on the secretsmanager endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# servicecatalog
variable "servicecatalog_endpoint_enable" {
  description = "Enable/Disable the servicecatalog VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "servicecatalog_private_dns_enable" {
  description = "Enable/Disable private dns on the servicecatalog endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# sns
variable "sns_endpoint_enable" {
  description = "Enable/Disable the sns VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "sns_private_dns_enable" {
  description = "Enable/Disable private dns on the sns endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# sqs
variable "sqs_endpoint_enable" {
  description = "Enable/Disable the sqs VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "sqs_private_dns_enable" {
  description = "Enable/Disable private dns on the sqs endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

# ssm
variable "ssm_endpoint_enable" {
  description = "Enable/Disable the ssm VPC Endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}

variable "ssm_private_dns_enable" {
  description = "Enable/Disable private dns on the ssm endpoint. Allowed values: true, false"
  type        = "string"
  default     = false
}
