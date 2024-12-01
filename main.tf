provider "azurerm"{
  features {}

  subscription_id = "94b32def-28a7-475d-bbe4-bfa09615697a"
}
# Define the resource group
resource"azurerm_resource_group" "cloudlearning" {
  name  = "cloudlearning3"
  location = "UKSouth"
}



resource "azurerm_container_group" "bharathcontainerinstance" {
  name                = "bharathcontainerinstance"
  location            = azurerm_resource_group.cloudlearning.location
  resource_group_name = azurerm_resource_group.cloudlearning.name
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
