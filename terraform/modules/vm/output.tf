output "admin_username" {
  value = azurerm_linux_virtual_machine.project_3.admin_username
}

output "admin_password" {
  value = azurerm_linux_virtual_machine.project_3.admin_password
}

output "public_ip_address" {
  value = azurerm_network_interface.project_3.private_ip_address
}