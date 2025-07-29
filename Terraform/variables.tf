variable "location" {
  description = "Azure region"
  default     = "canadacentral"
}

variable "resource_group_name" {
  description = "Resource Group name"
  default     = "rg-cloudkart"
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  default     = "asp-cloudkart-free"
}

variable "web_app_name" {
  description = "Web App name"
  default     = "cloudkart-webapp123"
}

variable "storage_account_name" {
  description = "Storage Account name"
  default     = "cloudkartstorage001"
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "tags" {
  description = "Tags applied to resources"
  type = map(string)
  default = {
    environment = "dev"
    owner       = "CloudKartTeam"
    project     = "CloudKart"
  }
}