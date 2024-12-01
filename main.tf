provider "azurerm"{
  features {}

  subscription_id = "94b32def-28a7-475d-bbe4-bfa09615697a"
}
# Define the resource group
resource"azurerm_resource_group" "cloudlearning" {
  name  = "cloudlearning3"
  location = "UKSouth"
}
