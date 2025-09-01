resource "aws_iam_role" "role" {
  name = "example-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "profile" {
  name = "example-instance-profile"
  role = aws_iam_role.role.name
}

output "iam_role_name" {
  value = aws_iam_instance_profile.profile.name
}
