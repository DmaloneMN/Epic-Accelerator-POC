
variable "resource_group_name" {}

resource "azurerm_powerbi_embedded" "main" {
  name                = "epic-powerbi"
  location            = "East US"
  resource_group_name = var.resource_group_name
  sku_name            = "A1"
}
