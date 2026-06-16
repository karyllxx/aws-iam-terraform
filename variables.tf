variable "aws_region" {
  type        = string
  description = "The AWS region for resources"
}

variable "project_id" {
  type        = string
  description = "The project identifier used for naming and tagging"
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of the pre-created S3 bucket"
}