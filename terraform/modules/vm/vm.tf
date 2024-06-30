resource "azurerm_network_interface" "project_3" {
  name                = "${var.application_type}-${var.resource_type}-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }
}

resource "azurerm_linux_virtual_machine" "project_3" {
  name                = "${var.application_type}-${var.resource_type}-machine"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_DS2_v2"
  admin_username      = "devopsagent"
  #admin_password      = "DevOpsAgent@123"
  disable_password_authentication = true
  
  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDkvLEVD436vyghNnQEYz/CPddchLmY+iUyJz/YhpXCpC93Um9OTZ4Z7AF9PYy5Nrzit0jSu0bc5hlhIYLSSTgxOntctBJo23IWwWut8q/NFbjAaL+5HrfcNIXLt4nK/wPkakzT68/vg/97eWI/H6ghFxFc3cW3pSfTGILsZKryR0QXPv6okVQAOZfJWhnx6QNv82B5TpPW75sxK304Q6h23YJXhH+gd+ZKSVhaKU/cc/SfRJ2vrneqSkM/IjZGiu7+Myvil1tlTVAtoso1vMEOpt/iz6x9ni8GZ2Iw2VUNbuu+bY/aI//7rWC6/Z1ZZpv6E3cWm+uSLuSSORuVqr9NcvyT346GKONNWWnv0octTxRy5/D/1U+xgng1btn7Hp7zwri+FKd5SV4DdR+J6BHJZY1JgPh5PRsDUCsRglsYyeypMJRsHcx0ZCl+0DC7T1KZV8XK5XTUd8VTgB4NJopcYIGIhqfIlxjVWDrZECwE7thnozEAyigQMJoNSe6rtRU= KHIEM@KHIEMPN"
  }

  network_interface_ids = [azurerm_network_interface.project_3.id]
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
