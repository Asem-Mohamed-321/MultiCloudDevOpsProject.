resource "aws_route_table" "routing_table" {
  vpc_id = var.vpc_id

#route to the gateway to allow route to public internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }
  tags = {
    Name = "finalproject-routetable"
  }
}

