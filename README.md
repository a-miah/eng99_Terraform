# Launching EC2 Instance on AWS with Terraform

## Downloading terraform 
1. Download Amd64 - https://www.terraform.io/downloads
2. Export zipped file into program files 
3. Run `terraform` and `terraform --version` to confirm download

## Env Variables
- Ensure you have AWS_ACCESS_KEY_ID and AWS_SECRET_KEY_ID environment variables
- Specify PATH for the downloaded terraform file

## Main.tf
- Create `main.tf` file
- Add code as in the main.tf file 

## Terraform commands 
- `terraform init` - initialises terraform
- `terraform plan` - checks files for errors before executing
- `terraform apply` - launches commands (such as EC2) on AWS
- `terraform destroy` - kills EC2

### SSH into Instance
- SSH into instance from bash by launching instance and copying SSH code

## Creating Variables
- Look at `variables.tf` file

## Creating VPC
- Look at `main.tf` file
Useful links: 
- https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
- https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1

## Creating Security Groups
- Look at `main.tf` file

## Creating EC2 Instance
- Look at `main.tf` file

