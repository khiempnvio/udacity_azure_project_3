
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

   ![Define prefix variable](/Images/az-login.png)
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

5. Run configure-tfstate-storage-account.sh file to create a storage azure
    ```
        ## Run in your local terminal
        ssh-keygen -t rsa
        cat ~/.ssh/id_rsa.pub
    ```
   
6. Generate an SSH key pair
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
7. Run Terraform Commands
    > terraform init

    > terraform plan

    > terraform apply
    
    > terraform destroy
        It will delete all resource you already created

#### 2. Set up an initial Pipeline
1. Login to dev.azure.com site
2. Create a Project with public mode
    ![Define prefix variable](/Images/az_dev_project.png)
3. Create a Service connection
    ![Define prefix variable](/Images/az_dev_service_connection.png)
4. Create a Agent pool
    ![Define prefix variable](/Images/az_dev_agent_pool.png)
5. Create a Vitrual machine to connect agent pool
    - go to azure portal and click create new vitrual machine
    - Run the following commands from an Azure cloud shell or terminal or command prompt
        1. login to vitrual machine
            > ssh devopsagent@70.37.97.22
        2. instal docker
            > sudo snap install Docker
        3. Configure the devopsagent user to run Docker.
            ```
                sudo groupadd docker
                sudo usermod -aG docker $USER
                exit
            ```
        Restart the Linux VM from Azure portal to apply changes made in previous steps. Restarting the VM will log you out from the SSH log in. 

        4. Configure the Agent (VM) - Install Agent Services
            - Go to agent on dev.azure.com and click new agent
                ![Define prefix variable](/Images/az_dev_new_agent.png)
            - Click on button copy and run bellow commands
                ```
                    curl -O curl -O https://vstsagentpackage.azureedge.net/agent/3.241.0/vsts-agent-linux-x64-3.241.0.tar.gz
                    mkdir myagent && cd myagent
                    tar zxvf ../vsts-agent-linux-x64-3.241.0.tar.gz
                    ./config.sh
                ```
            - Run the following commands to finish the set up.
                ```
                    sudo ./svc.sh install
                    sudo ./svc.sh start
                ```
        5. Prepare the Agent for running Flask application
            - Run commands to install packages for vitrual machine
                - Update latest packages
                    ```
                        sudo apt-get update
                        sudo apt update
                        sudo apt install software-properties-common
                        sudo add-apt-repository ppa:deadsnakes/ppa
                    ```
                -  Install Python and Python PIP
                    ```
                        sudo apt install python3.9
                        sudo apt-get install python3.9-venv
                        sudo apt-get install python3-pip
                        python3.9 --version
                        pip --version 
                    ```
                - Install tools for the Pipeline build steps.
                    ```
                        sudo apt-get install python3.7-distutils
                        sudo apt-get -y install zip
                    ```
        6. After you run all command above you can see green icon in Agent Pool
6. 
### II. Automated TestingDev Environment - Terraform
#### 1. Testing with JMeter
#### 2. Testing with Postman
#### 3. Testing with Selenium

### III. Monitoring & Observability
#### 1. Configure Azure Monitor
#### 2. Configure Azure Log Analytics

## Resource Cleanup
To prevent incurring Azure resource charges related to this project, it is advisable to remove the resource group housing the App Service and the App Service Plan.