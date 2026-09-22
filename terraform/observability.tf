resource "azurerm_log_analytics_workspace" "platform" {
  name                = "${local.name_prefix}-law-${random_string.suffix.result}"
  location            = azurerm_resource_group.workload.location
  resource_group_name = azurerm_resource_group.workload.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.common_tags
}
