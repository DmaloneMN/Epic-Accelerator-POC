
variable "resource_group_name" {}

resource "azurerm_storage_account" "main" {
  name                     = "epicstorageacct"
  resource_group_name      = var.resource_group_name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
