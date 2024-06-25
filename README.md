
# Azure Infrastructure Operations Project: Ensuring Quality Releases - Project Overview

## Introduction
For this project, you'll develop and demonstrate your skills in using a variety of industry leading tools, especially Microsoft Azure, to create disposable test environments and run a variety of automated tests with the click of a button. Additionally, you'll monitor and provide insight into your application's behavior, and determine root causes by querying the application’s custom log files.

## Getting Started
1. Clone this repository
2. Update this README to reflect how someone would use your code.

## Dependencies
1. Create an [Github Account](https://github.com)
2. Create an [Azure Account](https://portal.azure.com)
3. Create an [Dev Azure Account](https://dev.azure.com)
4. Installing [Postman](https://www.postman.com)
5. Installing [Python](https://www.python.org)
6. Installing [JMeter](https://jmeter.apache.org/download_jmeter.cgi)
7. Installing [Selenium](https://pypi.org/project/selenium/)
8. Installing [Terraform](https://www.terraform.io/downloads.html)

## Demonstration

https://youtu.be/QAz9EHo82Wo

## Instructions

### I. Environment Creation & Deployment
#### 1. Dev Environment - Terraform
1. Login to Azure
   > az login
2. Update Terraform Variables in terraform\environments\test\terraform.tfvars file
    ```
        subscription_id = "" #enter your subscription_id
        client_id = "" #enter your client_id
        client_secret = "" #enter your client_secret
        tenant_id = "" #enter your tenant_id
    ```

    ```
        location = "East US"
        resource_group_name = "Azuredevops"
        application_type = "myApplication"
    ```
3. Update terraform\environments\test\main.tf file
    ```
    terraform {
        backend "azurerm" {
              storage_account_name = "" #enter your storage_account_name
              container_name       = "tfstate" #enter your container_name
              key                  = "" #enter your key
              access_key           = "" #enter your key
        }
	}
    ```
4. Update terraform\modules\vm\vm.tf file
    - Update the terraform/modules/vm/input.tf file with the variables/values.

    - Verify/update the terraform/modules/vm/vm.tf file with the variables declared in the input.tf.

    - Once your VM will be ready using the final pipeline, you will have to SSH log into the machine to run Selenium functional (UI) tests. For SSH into the VM, either have an "admin_username/admin_password" pair in the vm.tf file or use SSH key pair, as explained in the next point.

5. Generate an SSH key pair
    ```
        ## Run in your local terminal
        ssh-keygen -t rsa
        cat ~/.ssh/id_rsa.pub
    ```
    ```
        admin_ssh_key {
        username   = "adminuser"
        public_key = "" #enter your key
        }
    ```
6. Run Terraform Commands
    > terraform init

    > terraform plan

    > terraform apply
    
    > terraform destroy

#### 2. Set up an initial Pipeline

### II. Automated TestingDev Environment - Terraform
#### 1. Testing with JMeter
#### 2. Testing with Postman
#### 3. Testing with Selenium

### III. Monitoring & Observability
#### 1. Configure Azure Monitor
#### 2. Configure Azure Log Analytics

## Resource Cleanup
To prevent incurring Azure resource charges related to this project, it is advisable to remove the resource group housing the App Service and the App Service Plan.