module "server" {
  source          = "../terraform-training-module"
  instance_subnet = aws_subnet.subnet.id
  instance_name   = var.instance_name
}
