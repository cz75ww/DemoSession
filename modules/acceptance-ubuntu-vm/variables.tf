variable "cidr_vpc" {
  description = "CIDR block for the VPC"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "Learn"
}

variable "region" {
  description = "The region Terraform deploys your instance"
}

variable "vpc_name" {
  description = "VPC name for TerraformClass"  
}

variable "ssh_user" {
  description = "ssh connection user"  
}

variable "aws_key_name" {
  description = "Key name for AWS environment"
}

variable "aws_key_path" {
  description = "Key path for AWS environment"
}

variable "internet_access" {
  description = "Internet access"
}

variable "ansible_acc_path" {
  description = "playbook path"
}

variable "server_tag_name" {
  description = "Server tag name on VPC"
}