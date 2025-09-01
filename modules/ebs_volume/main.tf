resource "aws_ebs_volume" "volume" {
  availability_zone = "us-east-1a"
  size              = 8

  tags = {
    Name = "example-ebs"
  }
}

output "volume_id" {
  value = aws_ebs_volume.volume.id
}
