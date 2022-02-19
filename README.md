# Demo session to deploy new webserver (Nginx)
## Requirements
* Terraform v1 or latest
* Ansible 2.9  or latest

## Introduction
* This automation is to the creation and deployment of a web server on AWS environment with health checks to as the server is up and running.
* Here we are using IaC tools, Terraform and Ansible to achieve our target.


## Why do we need both Terraform and Ansible?
* Terraform is designed to provision different infrastructure components.
* Ansible is a configuration-management and application-deployment tool. 
* It means that you’ll use Terraform first to create, for example, AWS resources (vpc, subnet and virtual machine) and then use Ansible to install necessary applications on that machine. But by default, these two are separate tools. In order to make them work together, we need to integrate Terraform-managed nodes with Ansible control nodes.
* [TerraformAnsible](https://www.hashicorp.com/resources/ansible-terraform-better-together) - Good page and video explaining why Ansible and HashiCorp are  better together.


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
*  Set up the hostname
*  Apply OS patches
*  Install requirements packages
*  Create web page directory
*  Delete default nginx site
*  Apply custom nginx
*  Check virtual machine public ip
*  Verify if the webpage has been started successfully

## Setup
#### To run this project, perform this command lines:
$ git clone https://github.com/cz75ww/DemoSession.git
$ Terraform init
$ terraform apply --auto-approve