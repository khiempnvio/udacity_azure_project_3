resource "azurerm_service_plan" "project_3" {
  name                = "${var.application_type}-${var.resource_type}-sp"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "project_3" {
  name                = "khiempn-udacity-1"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  service_plan_id     = azurerm_service_plan.project_3.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
  site_config {
    always_on = false
  }
}