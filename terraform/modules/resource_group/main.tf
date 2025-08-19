
resource "azurerm_resource_group" "main" {
  name     = "epic-accelerator-rg"
  location = "East US"
}

output "name" {
  value = azurerm_resource_group.main.name
}
