terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.13.0"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id = 5ddead9e-013d-441f-a427-d808cac56f31
}
