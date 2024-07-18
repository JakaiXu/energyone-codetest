resource "aws_vpc" "energy-one" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "energy-one-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.energy-one.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}
resource "aws_internet_gateway" "energy-one" {
  vpc_id = aws_vpc.energy-one.id
  tags = {
    Name = "energy-one-vpc-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.energy-one.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.energy-one.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "energy-one" {
  vpc_id = aws_vpc.energy-one.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "energy-one-sg"
  }
}
