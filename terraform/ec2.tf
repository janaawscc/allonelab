data "aws_ami" "amazonlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}


resource "aws_instance" "ansible" {
  ami             = data.aws_ami.amazonlinux.id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.ansible.id
  security_groups = [aws_security_group.ansible.name]

  key_name = var.key_name

  tags = {
    Name = "lab-ansible-instance"
  }
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.amazonlinux.id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.web.id
  security_groups = [aws_security_group.web.name]

  key_name = var.key_name

  tags = {
    Name = "lab-web-instance"
  }
}

resource "aws_instance" "db" {
  ami             = data.aws_ami.amazonlinux.id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.db.id
  security_groups = [aws_security_group.db.name]

  key_name = var.key_name

  tags = {
    Name = "lab-db-instance"
  }
}