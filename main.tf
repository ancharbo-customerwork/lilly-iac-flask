provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "lilly"
  location = "eastus"
}

resource "azurerm_function_app" "example" {
  name                       = "example-functionapp"
  location                   = "eastus"
  resource_group_name        = "lilly"
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}

resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_key_vault" "example" {
  name                = "example-keyvault"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = ARM_TENANT_ID
  sku_name = "standard"
}
resource "azurerm_storage_account" "blob_storage" {
  count                    = var.enable_blob_storage ? 1 : 0
  name                     = "exampleblobstoracc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "blob_container" {
  count               = var.enable_blob_storage ? 1 : 0
  name                = "content"
  storage_account_name = azurerm_storage_account.blob_storage[0].name
  container_access_type = "private"
}
