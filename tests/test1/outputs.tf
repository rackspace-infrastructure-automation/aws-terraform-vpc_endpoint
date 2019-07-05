output "s3_vpc_endpoint_id" {
  description = "S3 vpc endpoint ID"
  value       = "${module.vpc_endpoint.s3_vpc_endpoint_id}"
}

output "dynamodb_vpc_endpoint_id" {
  description = "S3 dynamodb endpoint ID"
  value       = "${module.vpc_endpoint.dynamodb_vpc_endpoint_id}"
}

output "codebuild_vpc_endpoint_id" {
  description = "Codebuild vpc endpoint ID"
  value       = "${module.vpc_endpoint.codebuild_vpc_endpoint_id}"
}

output "codebuild-fips_vpc_endpoint_id" {
  description = "Codebuild-fips vpc endpoint ID"
  value       = "${module.vpc_endpoint.codebuild-fips_vpc_endpoint_id}"
}

output "ec2_vpc_endpoint_id" {
  description = "EC2 vpc endpoint ID"
  value       = "${module.vpc_endpoint.ec2_vpc_endpoint_id}"
}

output "ec2messages_vpc_endpoint_id" {
  description = "EC2messages vpc endpoint ID"
  value       = "${module.vpc_endpoint.ec2messages_vpc_endpoint_id}"
}

output "elasticloadbalancing_vpc_endpoint_id" {
  description = "Elasticloadbalancing vpc endpoint ID"
  value       = "${module.vpc_endpoint.elasticloadbalancing_vpc_endpoint_id}"
}

output "events_vpc_endpoint_id" {
  description = "Events vpc endpoint ID"
  value       = "${module.vpc_endpoint.events_vpc_endpoint_id}"
}

output "execute-api_vpc_endpoint_id" {
  description = "Execute-api vpc endpoint ID"
  value       = "${module.vpc_endpoint.execute-api_vpc_endpoint_id}"
}

output "kinesis-streams_vpc_endpoint_id" {
  description = "Kinesis-streams vpc endpoint ID"
  value       = "${module.vpc_endpoint.kinesis-streams_vpc_endpoint_id}"
}

output "kms_vpc_endpoint_id" {
  description = "Kms vpc endpoint ID"
  value       = "${module.vpc_endpoint.kms_vpc_endpoint_id}"
}

output "logs_vpc_endpoint_id" {
  description = "Logs vpc endpoint ID"
  value       = "${module.vpc_endpoint.logs_vpc_endpoint_id}"
}

output "monitoring_vpc_endpoint_id" {
  description = "Monitoring vpc endpoint ID"
  value       = "${module.vpc_endpoint.monitoring_vpc_endpoint_id}"
}

output "sagemaker_runtime_vpc_endpoint_id" {
  description = "Sagemaker.runtime vpc endpoint ID"
  value       = "${module.vpc_endpoint.sagemaker_runtime_vpc_endpoint_id}"
}

output "secretsmanager_vpc_endpoint_id" {
  description = "Secretsmanager vpc endpoint ID"
  value       = "${module.vpc_endpoint.secretsmanager_vpc_endpoint_id}"
}

output "servicecatalog_vpc_endpoint_id" {
  description = "Servicecatalog vpc endpoint ID"
  value       = "${module.vpc_endpoint.servicecatalog_vpc_endpoint_id}"
}

output "sns_vpc_endpoint_id" {
  description = "SNS vpc endpoint ID"
  value       = "${module.vpc_endpoint.sns_vpc_endpoint_id}"
}

output "sqs_vpc_endpoint_id" {
  description = "SQS vpc endpoint ID"
  value       = "${module.vpc_endpoint.sqs_vpc_endpoint_id}"
}

output "ssm_vpc_endpoint_id" {
  description = "SSM vpc endpoint ID"
  value       = "${module.vpc_endpoint.ssm_vpc_endpoint_id}"
}
