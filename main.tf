data "aws_region" "current_region" {}

resource "aws_vpc_endpoint" "s3_endpoint" {
  count             = "${var.s3_endpoint_enable ? 1 : 0}"
  vpc_id            = "${var.vpc_id}"
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${data.aws_region.current_region.name}.s3"
  route_table_ids   = ["${var.route_tables_ids_list}"]
}

resource "aws_vpc_endpoint" "dynamo_endpoint" {
  count             = "${var.dynamo_db_endpoint_enable ? 1 : 0}"
  vpc_id            = "${var.vpc_id}"
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${data.aws_region.current_region.name}.dynamodb"
  route_table_ids   = ["${var.route_tables_ids_list}"]
}
