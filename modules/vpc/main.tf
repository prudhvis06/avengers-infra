resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 0)
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-subnet"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}
