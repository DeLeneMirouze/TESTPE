
resource "azurerm_private_endpoint" "pe" {
  name                = "myfdlmdbendpoint-pep"
  location            = "westeurope"
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.subnet.id


  private_service_connection {
    name                           = "myfdlmdbendpoint-psc"
    private_connection_resource_id = var.target_resource_id
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_a_record" "a_record" {
  name                = "foo"
  resource_group_name = var.resource_group_name
  zone_name           = "privatelink.database.windows.net"
  ttl                 = 10
  records             = [azurerm_private_endpoint.pe.private_service_connection[0].private_ip_address]
  provider            = azurerm.dns
}

data "azurerm_subnet" "subnet" {
  name                 = "name"
  virtual_network_name = "vnm"
  resource_group_name  = "rgn"
}

terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.79.0"
    }
  }
}

variable "resource_group_name" {
  type = string
}

variable "target_resource_id" {
  type = string
}
