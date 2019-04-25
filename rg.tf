resource "azurerm_resource_group" "test" {
  name     = "LSY_WEUR_ITCS_DEV_723593_RG_001"
  location = "westeurope"

  tags = {
    environment = "DONT RUN DESTROY"
  }
}
