output "hub_resource_group" {
  value = azurerm_resource_group.hub.name
}

output "workload_resource_group" {
  value = azurerm_resource_group.workload.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.platform.name
}

output "acr_login_server" {
  value = azurerm_container_registry.platform.login_server
}

output "key_vault_name" {
  value = azurerm_key_vault.platform.name
}

output "workload_identity_client_id" {
  value = azurerm_user_assigned_identity.workload.client_id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.platform.id
}
