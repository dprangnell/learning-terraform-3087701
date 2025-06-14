resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description

  vpc_id = data.aws_vpc.default.id
  tags   = local.combined_tags
}

resource "aws_vpc_security_group_ingress_rule" "web" {
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
  
  security_group_id = aws_security_group.this.id
}

resource "aws_vpc_security_group_ingress_rule" "tlsweb" {
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
  
  security_group_id = aws_security_group.this.id
}

resource "aws_vpc_security_group_egress_rule" "this" {
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"

  security_group_id = aws_security_group.this.id
}
