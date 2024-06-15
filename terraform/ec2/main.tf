resource "aws_instance" "ec2" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.fpsg.id]
  tags = {
    Name = "final-project"
  }
}


resource "aws_security_group" "fpsg" {
  name        = "finalproject_securitygroup"
  description = "Allow ssh and sonarqube inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "finalproject-securitygroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.fpsg.id
  cidr_ipv4         = var.vpc_cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_sonarqube" {
  security_group_id = aws_security_group.fpsg.id
  cidr_ipv4         = var.vpc_cidr_block
  from_port         = 9000
  ip_protocol       = "tcp"
  to_port           = 9000
}


resource "aws_vpc_security_group_ingress_rule" "allow_Jenkins" {
  security_group_id = aws_security_group.fpsg.id
  cidr_ipv4         = var.vpc_cidr_block
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.fpsg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


