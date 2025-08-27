import re

# Load the original main.tf.txt
with open("main.tf.txt", "r") as f:
    original_tf = f.read()

# Replace deprecated azurerm_app_service_plan with azurerm_service_plan and downgrade SKU
original_tf = original_tf.replace(
    'resource "azurerm_app_service_plan" "plan" {',
    'resource "azurerm_service_plan" "plan" {
  os_type             = "Windows"'
)
original_tf = original_tf.replace(
    'sku {\n    tier = "Standard"\n    size = "S1"\n  }',
    'sku_name = "F1"'
)
original_tf = original_tf.replace(
    'app_service_plan_id = azurerm_app_service_plan.plan.id',
    'app_service_plan_id = azurerm_service_plan.plan.id'
)

# Remove the old FHIR block and replace with correct Healthcare APIs workspace and FHIR service
original_tf = re.sub(r'resource "azurerm_healthcare_fhir_service"[\s\S]+?}', '', original_tf)

fhir_block = '''
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
}'''

# Append the corrected FHIR block
corrected_tf = original_tf.strip() + "\n\n" + fhir_block

# Save the corrected file
with open("main_corrected.tf", "w") as f:
    f.write(corrected_tf)

print("Fully corrected main.tf file has been saved as main_corrected.tf.")
