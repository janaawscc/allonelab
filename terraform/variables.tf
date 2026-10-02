variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "web_subnet_cidr" {
  description = "Web Subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  description = "DB Subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "ansible_subnet_cidr" {
  description = "Ansible Subnet CIDR"
  type        = string
  default     = "10.0.3.0/24"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
  default     = "terraform-admin-key"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "lab"
}