resource "azurerm_container_registry" "platform" {
  name                = "acg${var.environment}${random_string.suffix.result}acr"
  resource_group_name = azurerm_resource_group.workload.name
  location            = azurerm_resource_group.workload.location
  sku                 = "Standard"
  admin_enabled       = false
  tags                = local.common_tags
}
