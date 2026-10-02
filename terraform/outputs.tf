output "vpc_id" {
  value = aws_vpc.main.id
}

output "web_server_public_ip" {
  value = aws_instance.web.public_ip
}

output "web_server_private_ip" {
  value = aws_instance.web.private_ip
}

output "db_server_private_ip" {
  value = aws_instance.db.private_ip
}

output "ansible_server_public_ip" {
  value = aws_instance.ansible.public_ip
}

output "ansible_server_private_ip" {
  value = aws_instance.ansible.private_ip
}