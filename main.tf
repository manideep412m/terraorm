provider "azurerm"{
  features {}
  resource_provider_registrations = "none"
  subscription_id = "94b32def-28a7-475d-bbe4-bfa09615697a"
}
data "azurerm_resource_group" "bharathrs" {
  name = "bharathrs"
}




resource "azurerm_container_group" "bharathcontainerinstance" {
  name                = "bharathcontainerinstance"
  location            = azurerm_resource_group.bharathrs.location
  resource_group_name = azurerm_resource_group.bharathrs.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"

  container {
    name   = "hello-world"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}
