resource "azurerm_virtual_network" "project_3" {
  name                 = "${var.application_type}-${var.resource_type}-vn"
  address_space        = [var.address_space]
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group}"
}
resource "azurerm_subnet" "project_3" {
  name                 = "${var.application_type}-${var.resource_type}-sub"
  resource_group_name  = "${var.resource_group}"
  virtual_network_name = "${azurerm_virtual_network.project_3.name}"
  address_prefixes       = [var.address_prefix_test]
}
