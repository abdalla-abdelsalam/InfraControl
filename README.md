# infrastructure-as-code
Table of Contents
==================

- [infrastructure-as-code](#infrastructure-as-code)
- [Table of Contents](#table-of-contents)
  - [Description 🧐](#description-)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
    - [Initializing the Project](#initializing-the-project)
- [OR](#or)



## Description 🧐
This Terraform project aims to automate the setup and management of two environments, dev and prod, across two AWS regions: us-east-1 and eu-central-1. It also integrates Jenkins for continuous deployment and also includes automation for updating a Terraform state file stored in an S3 bucket and triggering a Lambda function to send email notifications using AWS SES if any changes happen in the state files.

## Prerequisites

Before getting started, ensure you have the following prerequisites in place:

* Terraform installed on your Jenkins server.
* AWS CLI configured with necessary credentials and permissions.
* S3 bucket for storing Terraform state files.
* dynamodb talbe con
* AWS SES configured for sending email notifications (if applicable).
* Jenkins server with necessary plugins (if applicable).

## Usage
### Initializing the Project

1. Clone this repository to your Jenkins server or local machine:
```bash
git clone https://github.com/yourusername/terraform-project.git
```
cd terraform-project

Initialize Terraform in the project directory:

csharp

    terraform init

Creating Workspaces

This project includes two predefined workspaces: dev and prod. You can create them using the following commands:

    For dev workspace:

    arduino

terraform workspace new dev

For prod workspace:

arduino

    terraform workspace new prod

Managing Variables

    Customize the variable values in the dev.tfvars and prod.tfvars files to match your specific environment requirements.

Creating the Infrastructure

    Select the appropriate workspace for the environment you want to create:

    csharp

terraform workspace select dev
# OR
terraform workspace select prod

Apply the Terraform configuration to create the infrastructure:

csharp

    terraform apply -var-file=dev.tfvars
    # OR
    terraform apply -var-file=prod.tfvars

Executing Local Provisioner

After creating the infrastructure, the local-exec provisioner will print the public IP of the Bastion EC2 instance in the specified environment. This is automatically done as part of the Terraform apply process.