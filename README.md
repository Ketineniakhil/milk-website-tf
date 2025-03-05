AWS S3 Static Website Deployment with Terraform

Overview

This Terraform configuration provisions an Amazon S3 bucket to host a static website with public access. The configuration ensures that the necessary policies and access control settings are in place.

Prerequisites

Before deploying, ensure you have:

Terraform installed (Install Terraform)

AWS CLI installed and configured (AWS CLI Setup)

An AWS account with permissions to manage S3 and IAM policies

Configuration

Variables

Update the terraform.tfvars file or define environment variables to set the following:

bucket_name = "your-unique-s3-bucket-name"
aws_region  = "us-east-1" # Change based on your region

Files Required

index.html → Your website's main page

error.html → Custom error page

milk-bottle.png → Example image (modify as needed)

Deployment Steps

1. Initialize Terraform

Run the following command to initialize Terraform:

terraform init

2. Plan Deployment

Check what Terraform will create/modify:

terraform plan

3. Apply Changes

Deploy the S3 static website:

terraform apply -auto-approve

4. Get Website URL

After successful deployment, Terraform will output the S3 website URL. You can manually retrieve it:

echo "http://${bucket_name}.s3-website-${aws_region}.amazonaws.com"

Verifying Deployment

Open the website URL in your browser.

If it doesn't load:

Ensure index.html exists in the S3 bucket.

Verify bucket policies in the AWS Console.

Cleanup (Destroy Resources)

To remove all deployed resources:

terraform destroy -auto-approve

Notes

Public Access: The bucket is configured for public read access.

Security: Consider using AWS CloudFront for better security and HTTPS support.

Domain Mapping: Use AWS Route 53 and CloudFront for custom domains.

Author: Ketineni Venkata Sai Akhil
