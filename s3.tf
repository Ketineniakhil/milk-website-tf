resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "ownership_access" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  block_public_acls       = false 
  block_public_policy     = false  
  ignore_public_acls      = false  
  restrict_public_buckets = false  
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  depends_on = [aws_s3_bucket_public_access_block.access_block]  

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:GetObject",
      Resource  = "${aws_s3_bucket.my_s3_bucket.arn}/*"
    }]
  })
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.my_s3_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  depends_on   = [aws_s3_bucket_policy.public_policy]
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.my_s3_bucket.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
  depends_on   = [aws_s3_bucket_policy.public_policy]
}

resource "aws_s3_object" "images" {
  bucket       = aws_s3_bucket.my_s3_bucket.id
  key          = "milk-bottle.png"
  source       = "milk-bottle.png"
  content_type = "image/png"
  depends_on   = [aws_s3_bucket_policy.public_policy]
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
