output "s3_vpc_endpoint_id" {
  description = "S3 vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.s3_endpoint.*.id, list("")), 0)}"
}

output "dynamodb_vpc_endpoint_id" {
  description = "S3 dynamodb endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.dynamo_endpoint.*.id, list("")), 0)}"
}

output "codebuild_vpc_endpoint_id" {
  description = "Codebuild vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.codebuild_endpoint.*.id, list("")), 0)}"
}

output "codebuild-fips_vpc_endpoint_id" {
  description = "Codebuild-fips vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.codebuild-fips_endpoint.*.id, list("")), 0)}"
}

output "ec2_vpc_endpoint_id" {
  description = "EC2 vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.ec2_endpoint.*.id, list("")), 0)}"
}

output "ec2messages_vpc_endpoint_id" {
  description = "EC2messages vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.ec2messages_endpoint.*.id, list("")), 0)}"
}

output "elasticloadbalancing_vpc_endpoint_id" {
  description = "Elasticloadbalancing vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.elasticloadbalancing_endpoint.*.id, list("")), 0)}"
}

output "events_vpc_endpoint_id" {
  description = "Events vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.events_endpoint.*.id, list("")), 0)}"
}

output "execute-api_vpc_endpoint_id" {
  description = "Execute-api vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.execute-api_endpoint.*.id, list("")), 0)}"
}

output "kinesis-streams_vpc_endpoint_id" {
  description = "Kinesis-streams vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.kinesis-streams_endpoint.*.id, list("")), 0)}"
}

output "kms_vpc_endpoint_id" {
  description = "Kms vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.kms_endpoint.*.id, list("")), 0)}"
}

output "logs_vpc_endpoint_id" {
  description = "Logs vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.logs_endpoint.*.id, list("")), 0)}"
}

output "monitoring_vpc_endpoint_id" {
  description = "Monitoring vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.monitoring_endpoint.*.id, list("")), 0)}"
}

output "sagemaker_runtime_vpc_endpoint_id" {
  description = "Sagemaker.runtime vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.sagemaker_runtime_endpoint.*.id, list("")), 0)}"
}

output "secretsmanager_vpc_endpoint_id" {
  description = "Secretsmanager vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.secretsmanager_endpoint.*.id, list("")), 0)}"
}

output "servicecatalog_vpc_endpoint_id" {
  description = "Servicecatalog vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.servicecatalog_endpoint.*.id, list("")), 0)}"
}

output "sns_vpc_endpoint_id" {
  description = "SNS vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.sns_endpoint.*.id, list("")), 0)}"
}

output "ssm_vpc_endpoint_id" {
  description = "SSM vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.ssm_endpoint.*.id, list("")), 0)}"
}
