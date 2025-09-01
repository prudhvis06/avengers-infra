resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.iam_role_name

  user_data = file(var.user_data_path)

  tags = {
    Name = "avengers-ec2"
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}
