
variable "resource_group_name" {}

resource "azurerm_cognitive_account" "openai" {
  name                = "epic-openai"
  location            = "East US"
  resource_group_name = var.resource_group_name
  kind                = "OpenAI"
  sku_name            = "S0"

  properties {
    api_key = "your-openai-api-key"
  }
}
