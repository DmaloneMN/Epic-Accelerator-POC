
variable "resource_group_name" {}

resource "azurerm_app_service_plan" "main" {
  name                = "epic-app-plan"
  location            = "East US"
  resource_group_name = var.resource_group_name
  kind                = "App"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}
