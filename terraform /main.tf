
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.79.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  subscription_id            = "46d88689-2150-4100-aa13-d503ed0078fd"
  features {}
}
