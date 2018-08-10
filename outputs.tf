output "s3_vpc_endpoint_id" {
  description = "S3 vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.s3_endpoint.*.id, list("")), 0)}"
}

output "dynamodb_vpc_endpoint_id" {
  description = "S3 vpc endpoint ID"
  value       = "${element(coalescelist(aws_vpc_endpoint.dynamo_endpoint.*.id, list("")), 0)}"
}
