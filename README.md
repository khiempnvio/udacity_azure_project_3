
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
1. Using Azure Pipeline to deploy Terrform Infrastructure as Code (IaC). Below are screenshots of the log output of Terraform when executed by the CI/CD pipeline.
    ![Define prefix variable](/Images/terraform_by_cicd.png)
2. Azure Pipline run job Terraform 
    ![Define prefix variable](/Images/terraform_by_cicd.png)
### II. Automated TestingDev Environment - Terraform
#### 1. Testing with JMeter
#### 2. Testing with Postman
#### 3. Testing with Selenium

### III. Monitoring & Observability
#### 1. Configure Azure Monitor
#### 2. Configure Azure Log Analytics

## Resource Cleanup
To prevent incurring Azure resource charges related to this project, it is advisable to remove the resource group housing the App Service and the App Service Plan.