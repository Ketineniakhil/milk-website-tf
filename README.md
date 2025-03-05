***AWS S3 Static Website Deployment using Terraform**

**Overview**

This project uses Terraform to provision an AWS S3 bucket configured as a static website. It includes bucket policies, access control configurations, and automated file uploads to host a static website.

**Prerequisites**

Ensure you have the following installed:
Terraform (latest version recommended)
AWS CLI (configured with valid credentials)
An AWS account with permissions to create and manage S3 buckets

**Project Structure**

├── main.tf               # Terraform configuration for S3 bucket & policies                                             
├── variables.tf          # Variables for bucket configuration                                         
├── outputs.tf            # Outputs such as the website URL                                   
├── index.html            # Main HTML file for the website                                         
├── error.html            # Error page HTML file                                       
├── images/               # Directory for images                                
├── terraform.tfstate     # Terraform state file (generated after apply)                      
└── README.md             # Project documentation                                           

**Terraform Resources Used**

-> aws_s3_bucket: Creates an S3 bucket.                                                           
-> aws_s3_bucket_ownership_controls: Sets object ownership to BucketOwnerPreferred.                                  
-> aws_s3_bucket_public_access_block: Blocks public ACLs and policies.                                        
-> aws_s3_bucket_policy: Allows public read access to objects inside the bucket.                                       
-> aws_s3_object: Uploads website files to S3.                                                                  
-> aws_s3_bucket_website_configuration: Configures the bucket for static website hosting.                                           

🔧 Usage

Initialize Terraform:
```sh
terraform init
```
Plan Deployment:
```sh
terraform plan
 ```
Apply Changes:
```sh
terraform apply -auto-approve
 ```
Destroy Resources:
```sh
terraform destroy -auto-approve
 ```

**Troubleshooting**

**1. Access Denied Errors**

Ensure your AWS IAM user has s3:PutBucketPolicy, s3:PutObject, and s3:GetObject permissions.
Update the bucket policy manually if needed.

**2. Website Not Loading**

Check if the S3 bucket has static website hosting enabled.
Ensure the index.html file is uploaded correctly.
Verify that the public access settings allow object retrieval.

**Author**

Ketineni Venkata Sai Akhil

**License**

This project is licensed under the MIT License. Feel free to use and modify as needed.

