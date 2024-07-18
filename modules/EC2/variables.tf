variable "subnet_id" {
  description = "The ID of the subnet to deploy the instance into"
}

variable "vpc_security_group_ids" {
  description = "The IDs of the security groups to assign to the instance"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
}

variable "instance_type" {
  description = "The instance type to use"
}

