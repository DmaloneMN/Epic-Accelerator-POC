
provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../modules/resource_group"
}

module "storage_account" {
  source = "../modules/storage_account"
  resource_group_name = module.resource_group.name
}

module "app_service_plan" {
  source = "../modules/app_service_plan"
  resource_group_name = module.resource_group.name
}

module "openai" {
  source = "../modules/openai"
  resource_group_name = module.resource_group.name
}

module "powerbi" {
  source = "../modules/powerbi"
  resource_group_name = module.resource_group.name
}
