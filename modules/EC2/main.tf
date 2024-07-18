resource "aws_instance" "energy-one" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = true
  tags = {
    Name = "energyone-code-test"
  }
}
