resource "aws_s3_bucket" "terraform-bucket" {
    bucket = "terraform-dan-2023--us-west-2-qa-482578067065"
    # aws_s3_bucket_versioning = true
    # versioning {
    #     enabled = true
    # }
    # server_side_encryption_configuration {
    #     rule {
    #         apply_server_side_encryption_by_default {
    #             sse_algorithm = "AES256"
    #         }
    #     }
    # }
    object_lock_enabled = true
    # object_lock_configuration {
    #     object_lock_enabled = "Enabled"
    # }
    tags = {
        Name = "S3 Remote Terraform State Store"
    }
}


resource "aws_s3_bucket_versioning" "versioning_terraform-bucket" {
  bucket = aws_s3_bucket.terraform-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "encryption-terraform-bucket" {
  bucket = aws_s3_bucket.terraform-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      # kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "AES256"
    }
  }
}