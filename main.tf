terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest version if possible
    }
  }
}

provider "aws" {
  region = "us-east-2"
  
}

resource "aws_s3_bucket" "g_check_bucket" {
  bucket_prefix = "jenkins-"
  force_destroy = true

  tags = {
    Name = "Jenkins Bucket"
  }
}

resource "aws_s3_object" "armageddon_repo_url" {
  bucket = aws_s3_bucket.g_check_bucket.id
  key    = "Deliverables/armageddon_repo_url.md"
  source = "Deliverables/armageddon_repo_url.md"
  etag   = filemd5("Deliverables/armageddon_repo_url.md")
}

resource "aws_s3_object" "github_working_webhook_trigger" {
  bucket = aws_s3_bucket.g_check_bucket.id
  key    = "Deliverables/github_working_webhook trigger.jpeg"
  source = "Deliverables/github_working_webhook trigger.jpeg"
  etag   = filemd5("Deliverables/github_working_webhook trigger.jpeg")
}

resource "aws_s3_object" "succesful_jenkins_tf_deployment_1" {
  bucket = aws_s3_bucket.g_check_bucket.id
  key    = "Deliverables/succesful_jenkins_tf_deployment_1.jpeg"
  source = "Deliverables/succesful_jenkins_tf_deployment_1.jpeg"
  etag   = filemd5("Deliverables/succesful_jenkins_tf_deployment_1.jpeg")
}

resource "aws_s3_object" "theo_approval_placeholder" {
  bucket = aws_s3_bucket.g_check_bucket.id
  key    = "Deliverables/theo_approval_placeholder.jpeg"
  source = "Deliverables/theo_approval_placeholder.jpeg"
  etag   = filemd5("Deliverables/theo_approval_placeholder.jpeg")
}

resource "aws_s3_bucket_public_access_block" "g_check_bucket" {
  bucket = aws_s3_bucket.g_check_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "g_check_bucket" {
  bucket = aws_s3_bucket.g_check_bucket.id

  depends_on = [aws_s3_bucket_public_access_block.g_check_bucket]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.g_check_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_object" "jason_g_check_jenkins_console_log" {
  bucket = aws_s3_bucket.g_check_bucket.id
  key    = "Deliverables/jason_g_check_jenkins_console_log.txt"
  source = "Deliverables/jason_g_check_jenkins_console_log.txt"
  etag   = filemd5("Deliverables/jason_g_check_jenkins_console_log.txt")
}

resource "aws_s3_object" "s3_bucket_proof" {
  bucket = aws_s3_bucket.g_check_bucket.id
  key    = "Deliverables/s3_bucket_proof.jpeg"
  source = "Deliverables/s3_bucket_proof.jpeg"
  etag   = filemd5("Deliverables/s3_bucket_proof.jpeg")
}