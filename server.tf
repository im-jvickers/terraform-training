resource "aws_instance" "server" {
  ami           = var.instance_ami
  instance_type = var.instance_size
  key_name      = aws_key_pair.key.key_name

  network_interface {
    network_interface_id = aws_network_interface.server_ni.id
    device_index         = 0
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_network_interface" "server_ni" {
  subnet_id   = aws_subnet.subnet.id
  private_ips = ["10.0.0.100"]

  tags = {
    Name = "${var.instance_name}-NI"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "jv-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFt3GTnF1dVyguOBb3dQnz+m8fjPZRBi2hyoFdaRW3sItwxSjVSMVtsdTrTZiwHOulgXfhlXzEjGwP2DakbyNZcSkNzH+IEujpFlQAR0ISjzIOUb6ju8STrJs74ng7+eni6lkGYb4VTccBKj4x8ADcCl/T+DD9SC+3u+QfNiWiB+Gn4e9G3tNA9m9Lp0DSRsSYIpj3O0i/90EOWM/CdF/wCX+lLlHw1B3cUDdUZokNJFzgi255E1XqqixrQY8mWoPqsxJ6P34TsMKYZh81tiwnjRHP1XUZwwJ88OfoIUxDHPy3ofobFabd/z0Jx4zCmlsph+K9HhtL/yzzWti33nR+LIItRxVcRSnNGejO+bJhupua/cSyZeu7QpHNVNAJnL7c747CQD1gnbuQl2SEDwKLyNu92BHPUeqAHl11TJhoU2hSDOXF4hCSNMh/ju80vZxQyt6G55AdYoBe/8MNKNkqam9y/79AUQMuTFl7+gNBxxAgtKuC+FH2+wkjPuu/rcc="
}
