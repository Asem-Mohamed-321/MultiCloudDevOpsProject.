resource "aws_subnet" "main-subnet" {
  
  cidr_block = "10.0.0.0/24"
  vpc_id     = var.vpc_id
  tags = {
    Name = "finalproject-subnet"
  }
}

