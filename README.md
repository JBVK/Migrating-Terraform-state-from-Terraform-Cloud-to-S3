# Example Code for Migrating Terraform State from Terraform Cloud to AWS S3

This repository contains example code to assist with migrating your Terraform state from Terraform Cloud to an AWS S3 backend with DynamoDB for state locking.

## Repository Structure

The repository is organized into two directories:

	1.	S3-Backend: Contains the Terraform code to create the S3 bucket and DynamoDB table required for the backend.
	2.	Backend-Block: Contains the Terraform code demonstrating how to configure the backend block to use the S3 backend with the resources created.