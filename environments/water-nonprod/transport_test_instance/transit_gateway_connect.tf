data "aws_subnet_ids" "trtst_subnet" {
  vpc_id = "vpc-0f5660d6cf7e4bf4c"
}


#resource "aws_ec2_transit_gateway_vpc_attachment" "arq" {
#  subnet_ids         = [data.aws_subnet_ids.trtst_subnet.id]
#  transit_gateway_id = "tgw-09bc9fbb14899984f"
#  vpc_id             = "vpc-0f7e30f6e14ca74ea"
#}