# Demo session to deploy new webserver (Nginx)
## Requirements
* Terraform v1 or latest
* Ansible 2.9  or latest

## Introduction
* This automation is to the creation and deployment of a web server on AWS environment with health checks to as the server is up and running
* Here we are using IaC tools, Terraform and Ansible to achieve our target 


## Why do we need both Terraform and Ansible?
* Terraform is designed to provision different infrastructure components
* Ansible is a configuration-management and application-deployment tool. 
* It means that you’ll use Terraform first to create, for example, AWS resources (vpc, subnet and virtual machine) and then use Ansible to install necessary applications on that machine. But by default, these two are separate tools. In order to make them work together, we need to integrate Terraform-managed nodes with Ansible control nodes.

## Terraform
#### To deploy the AWS resources,terraform will create the following resources:
* VPC (Virtual Private Cloud)
* Public Subnet
* Internet Gatway
* Route Table
* Public Security Group (Firewall rules for ssh and http protocols)
* Run Ansible playbook tasks

## Ansible
#### To install the applications, packages and apply the following settings:
*  
