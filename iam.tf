provider "aws" {}

resource "aws_iam_group" "this" {
  name = "${var.project_id}-iam-group"
}

resource "aws_iam_policy" "this" {
  name        = "${var.project_id}-iam-policy"
  description = "Custom IAM policy for S3 bucket write access"
  policy      = templatefile("${path.module}/policy.json", {
    bucket_name = var.s3_bucket_name
  })
  tags = {
    Project = var.project_id
  }
}

resource "aws_iam_role" "this" {
  name = "${var.project_id}-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Project = var.project_id
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.project_id}-iam-instance-profile"
  role = aws_iam_role.this.name
  tags = {
    Project = var.project_id
  }
}