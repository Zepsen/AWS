resource "aws_instance" "web" {
  ami                  = var.ami
  instance_type        = "t2.micro"
  security_groups      = var.security_groups
  key_name             = aws_key_pair.ssh.key_name
  user_data            = var.with_ebs ? file("./cloudinit/init_copy.sh") : file("./cloudinit/init.sh")
  iam_instance_profile = var.role
  tags = {
    Name = var.name
  }

  dynamic "ebs_block_device" {
    for_each = var.with_ebs ? [1] : []
    content {
      delete_on_termination = true
      volume_size           = 8
      device_name           = "/dev/sdf"
    }
  }
}

# We need generate ssh keys for this instance before using this modules
resource "aws_key_pair" "ssh" {
  key_name   = var.ssh_key
  public_key = file("./ssh-keys/${var.ssh_key}.pub")
}
