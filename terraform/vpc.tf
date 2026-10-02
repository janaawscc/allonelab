resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "lab-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "lab-igw"
  }
}

resource "aws_subnet" "web" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.web_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "lab-web-subnet"
  }
}

resource "aws_subnet" "db" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "lab-db-subnet"
  }
}

resource "aws_subnet" "ansible" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.ansible_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "lab-ansible-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "web" {
  subnet_id      = aws_subnet.web.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "ansible" {
  subnet_id      = aws_subnet.ansible.id
  route_table_id = aws_route_table.public.id
}

