terraform {
  required_providers {
    azurerm = {
      version = ">=3.10.0"
    }
  }
}

provider "azurerm" {
  features {}
}
