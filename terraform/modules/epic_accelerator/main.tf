variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "audience" {
  type = string
}

resource "azurerm_service_plan" "plan" {
  name                = "epic-accelerator-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "F1"
}

resource "azurerm_windows_web_app" "app" {
  name                = "epic-accelerator-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = true
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_healthcare_workspace" "workspace" {
  name                = "epic-healthcare-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_healthcare_fhir_service" "fhir" {
  name                = "epic-fhir-service"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "fhir-R4"
  workspace_id        = azurerm_healthcare_workspace.workspace.id

  authentication {
    authority           = "https://login.microsoftonline.com/${var.tenant_id}"
    audience            = var.audience
    smart_proxy_enabled = false
  }
}
