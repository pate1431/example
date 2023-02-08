terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.42.0"
    }
  }
}
provider "azurerm" {
  # Configuration options
  features {

  }
}

resource "azurerm_resource_group" "main_resource_grp" {
  name     = "mainResourcegrp"
  location = "canada-central"
}

resource "azurerm_storage_account" "exampleOne" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.main_resource_grp.name
  location                 = azurerm_resource_group.main_resource_grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "name" = "first-sa"
  }

}
resource "azurerm_storage_account" "exampleTwo" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.main_resource_grp.name
  location                 = azurerm_resource_group.main_resource_grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    "name" = "second-sa"
  }
  depends_on = [
    azurerm_storage_account.exampleOne
  ]
}