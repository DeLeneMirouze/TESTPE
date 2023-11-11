provider "azurerm" {
  tenant_id       = "123456"
  subscription_id = "789456"

  skip_provider_registration = true

  features {
  }
}

provider "azurerm" {
  alias                      = "dns"
  skip_provider_registration = true
  features {}
  subscription_id = "58e415dc"
}

terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.79.0"
      configuration_aliases = [azurerm.dns]
    }
  }

  backend "local" {
  }
}

