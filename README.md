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

## Instructions

### I. Environment Creation & Deployment
#### 1. Dev Environment - Terraform
1. Using Azure Pipeline to deploy Terrform Infrastructure as Code (IaC). Below are screenshots of the log output of Terraform when executed by the CI/CD pipeline.
    ![Define prefix variable](/screenshots/terraform_final.png)
    ![Define prefix variable](/screenshots/terraform_strorage_container.png)
2. Azure Pipline run job Terraform 
    ![Define prefix variable](/screenshots/terraform_by_cicd.png)
3. Azure Pipline run jobs successfully
    ![Define prefix variable](/screenshots/az_run_jobs_successfully_list.png)

### II. Automated TestingDev Environment - Terraform
#### 1. Automated Testing Tasks
1. Here, we provide a screenshot of the successful execution of the pipeline build results page (/_build/results?buildId={id}&view=results):
    ![Define prefix variable](/screenshots/az_run_jobs_successfully.png)
#### 2. Testing with JMeter
1. Load Test suit in azure pipeline
    ![Define prefix variable](/screenshots/jmester_step1.png)
2. Test suit run completed
    ![Define prefix variable](/screenshots/jmester_step2.png)

#### 3. Testing with Postman
1. Screenshot from postman result in azure pipelines
    ![Define prefix variable](/screenshots/postman_result.png)
#### 4. Testing with Selenium
1. Screenshot from selenium result in azure pipelines
    ![Define prefix variable](/screenshots/selenium_result.png)
#### 5. Testing Test Result
1. Screenshot from test result page
    ![Define prefix variable](/screenshots/testing_test_results.png)
#### 6. Testing Run Summary
1. Screenshot of the Run Summary page, which contains four graphs
    ![Define prefix variable](/screenshots/testing_summary.png)
### III. Monitoring & Observability
#### 1. Configure Azure Monitor
1. Here are screenshots of the graphs of the resource when the alert was triggered:
    - Set Alert Rules
        ![Define prefix variable](/screenshots/alert_rule.png)
    - Set Action Group
        ![Define prefix variable](/screenshots/action_group.png)
#### 2. Configure Azure Log Analytics
1. Metrics report and email alert rule
    - Metrics alter rules
        ![Define prefix variable](/screenshots/alert_404.png)
    - Email alter rules
        ![Define prefix variable](/screenshots/email_404.png)
    - Email alter rules
        ![Define prefix variable](/screenshots/log_analytics.png)
## Resource Cleanup
To prevent incurring Azure resource charges related to this project, it is advisable to remove the resource group housing the App Service and the App Service Plan.