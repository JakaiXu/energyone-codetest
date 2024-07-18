module "EC2-instance" {
  source                 = "./modules/EC2"
  subnet_id              = module.VPC-energy-one.public_subnet_id
  vpc_security_group_ids = [module.VPC-energy-one.security_group_id]
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
}
module "VPC-energy-one" {
  source             = "./modules/VPC"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

output "instance_id" {
  value = module.EC2-instance.instance_id
}

output "public_ip" {
  value = module.EC2-instance.public_ip
}
