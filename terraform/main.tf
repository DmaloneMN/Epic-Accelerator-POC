terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "epic-accelerator-rg"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "epicacceleratorstorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "plan" {
  name                = "epic-accelerator-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "F1"  # Free tier for testing
}

resource "azurerm_app_service" "app" {
  name                = "epic-accelerator-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.plan.id
}

resource "azurerm_healthcare_apis_workspace" "workspace" {
  name                = "epic-healthcare-workspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_healthcare_fhir_service" "fhir" {
  name                = "epic-fhir-service"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "fhir-R4"
  workspace_id        = azurerm_healthcare_apis_workspace.workspace.id

  authentication {
    authority           = "https://login.microsoftonline.com/${var.tenant_id}"
    audience            = var.audience
    smart_proxy_enabled = false
  }
}
