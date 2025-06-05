resource "aws_security_group" "arsenal-sg" {
  name        = "arsenal-sg"
  description = "arsenal-sg"
  tags = {
    Name = "arsenal-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh_from_my_ip" {
  security_group_id = aws_security_group.arsenal-sg.id
  cidr_ipv4         = "193.224.106.21/32" # Replaced with my actual IP address
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
# 193.224.106.21/32
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.arsenal-sg.id
  cidr_ipv6         = "::/0" # Allowing all IPv6 addresses
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutbound_ipv4" {
  security_group_id = aws_security_group.arsenal-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutbound_ipv6" {
  security_group_id = aws_security_group.arsenal-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}