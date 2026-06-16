output "iam_group_name" {
  value       = aws_iam_group.this.name
  description = "The name of the created IAM group"
}

output "iam_policy_arn" {
  value       = aws_iam_policy.this.arn
  description = "The ARN of the created custom IAM policy"
}

output "iam_role_name" {
  value       = aws_iam_role.this.name
  description = "The name of the created IAM role"
}

output "iam_instance_profile_name" {
  value       = aws_iam_instance_profile.this.name
  description = "The name of the created IAM instance profile"
}