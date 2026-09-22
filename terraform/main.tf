resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "hub" {
  name     = "${local.name_prefix}-hub-rg"
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "workload" {
  name     = "${local.name_prefix}-workload-rg"
  location = var.location
  tags     = local.common_tags
}
