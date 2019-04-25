#if you use the sandbox_sub
resource "azurerm_resource_group" "test" {
  name     = "whatever_resource_group_name"
  location = "westeurope"

  tags = {
    environment = "run whatever you want"
  }
}
