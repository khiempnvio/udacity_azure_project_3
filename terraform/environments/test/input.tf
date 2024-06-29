# Azure GUIDS
variable "subscription_id" {
    default = "6e375b9d-ad4b-4945-b141-04c0f4b89b97"
}
variable "client_id" {
    default = "4daa1114-f9b7-4268-a960-4a7aeda6cc22"
}
variable "client_secret" {
    default = ""
}
variable "tenant_id" {
    default = "f958e84a-92b8-439f-a62d-4f45996b6d07"
}

# Resource Group/Location
variable "location" {
    default = "East US"
}
variable "resource_group" {
    default = "Azuredevops"
}
variable "application_type" {
    default = "python_webserver"
}

# Network
variable virtual_network_name {
    default = "virtual_network_name_python_webserver"
}
variable address_prefix_test {
    default = "10.0.1.0/24"
}
variable address_space  {
    default = "10.0.0.0/16"
}