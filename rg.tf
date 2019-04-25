resource "azurerm_resource_group" "test" {
  name     = "LSY_WEUR_ITCS_DEV_723593_RG_001"
  location = "westeurope"

  tags = {
    environment = "DONT RUN DESTROY"
  }
}

# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "myVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.test.name}"

    tags {
        environment = "Terraform Demo"
    }
}