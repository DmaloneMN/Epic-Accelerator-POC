variable "resource_group_name" {
  description = "Name of the resource group to deploy resources into"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "tenant_id" {
  description = "Azure Active Directory tenant ID for authentication"
  type        = string
}

variable "audience" {
  description = "FHIR service audience URL"
  type        = string
}
