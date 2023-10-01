# infrastructure-as-code
Table of Contents
==================

- [infrastructure-as-code](#infrastructure-as-code)
- [Table of Contents](#table-of-contents)
  - [Description 🧐](#description-)



## Description 🧐
this Terraform project aims to automate the setup and management of two environments, dev and prod, across two AWS regions: us-east-1 and eu-central-1. It also integrates Jenkins for continuous deployment and also includes automation for updating a Terraform state file stored in an S3 bucket and triggering a Lambda function to send email notifications using AWS SES if any changes happen in the state files.
