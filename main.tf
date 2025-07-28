provider "azurerm" {
  features {}

  subscription_id = "4511020a-62cf-4280-a46c-939a029d8add"
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "log" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_app_service_plan" "plan" {
  name                = "asp-cloudkart-linux"
  location            = "Canada Central"
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = {
    project     = "CloudKart"
    environment = "dev"
    owner       = "CloudKartTeam"
  }
}

resource "azurerm_app_service" "app" {
  name                = var.web_app_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "PYTHON|3.10"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  tags = var.tags
}

output "webapp_url" {
  description = "URL of the deployed web app"
  value       = azurerm_app_service.app.default_site_hostname
}