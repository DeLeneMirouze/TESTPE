provider "azurerm" {
  tenant_id       = "396b38cc"
  subscription_id = "99c6c0c86"

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

