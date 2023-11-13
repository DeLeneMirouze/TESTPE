
provider azurerm {
  tenant_id       = "852"
  subscription_id = "789"

  skip_provider_registration = true

  features {
  }
}

provider azurerm {
  alias                      = "dns"
  skip_provider_registration = true
  features {}
  subscription_id = "456"
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

