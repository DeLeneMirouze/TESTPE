
resource "azurerm_mssql_server" "primary" {
  name                          = "myfdlmdb"
  resource_group_name           = var.resource_group_name
  location                      = "westeurope"
  administrator_login           = "dba_admin"
  administrator_login_password  = "Azerty1234!"
  minimum_tls_version           = "1.2"
  version                       = "12.0"
  public_network_access_enabled = true
}

module "privateLink_primary" {
  count               = var.deployPrivateLink ? 1 : 0
  source              = "../private_endpoints"
  resource_group_name = var.resource_group_name
  target_resource_id  = azurerm_mssql_server.primary.id
  providers = {
    azurerm = azurerm.dns
  }
}

terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.79.0"
    }
  }
}

variable "deployPrivateLink" {
  type = bool
}

variable "resource_group_name" {
  type = string
}
