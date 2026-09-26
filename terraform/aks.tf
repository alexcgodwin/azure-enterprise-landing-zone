resource "azurerm_kubernetes_cluster" "platform" {
  name                = "${local.name_prefix}-aks"
  location            = azurerm_resource_group.workload.location
  resource_group_name = azurerm_resource_group.workload.name
  dns_prefix          = "${local.name_prefix}-aks"

  private_cluster_enabled   = var.private_cluster_enabled
  oidc_issuer_enabled       = true
  workload_identity_enabled = true
  azure_policy_enabled      = true
  local_account_disabled    = true

  default_node_pool {
    name                         = "system"
    vm_size                      = var.system_node_vm_size
    vnet_subnet_id               = azurerm_subnet.aks.id
    auto_scaling_enabled         = true
    min_count                    = 1
    max_count                    = var.system_node_max_count
    only_critical_addons_enabled = var.enable_user_node_pool
    os_disk_type                 = "Managed"

    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }

  identity {
    type = "SystemAssigned"
  }

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = true
    tenant_id          = data.azurerm_client_config.current.tenant_id
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_data_plane  = "cilium"
    load_balancer_sku   = "standard"
    outbound_type       = "loadBalancer"
    service_cidr        = local.kubernetes_service_cidr
    dns_service_ip      = local.kubernetes_dns_service_ip
  }

  oms_agent {
    log_analytics_workspace_id      = azurerm_log_analytics_workspace.platform.id
    msi_auth_for_monitoring_enabled = true
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  tags = local.common_tags
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  count                 = var.enable_user_node_pool ? 1 : 0
  name                  = "workload"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.platform.id
  vm_size               = var.user_node_vm_size
  vnet_subnet_id        = azurerm_subnet.aks.id
  mode                  = "User"
  auto_scaling_enabled  = true
  min_count             = 1
  max_count             = 5
  os_disk_type          = "Managed"
  tags                  = local.common_tags
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.platform.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.platform.kubelet_identity[0].object_id
}

resource "azurerm_federated_identity_credential" "workload" {
  name                      = "${local.name_prefix}-workload-fic"
  audience                  = ["api://AzureADTokenExchange"]
  issuer                    = azurerm_kubernetes_cluster.platform.oidc_issuer_url
  user_assigned_identity_id = azurerm_user_assigned_identity.workload.id
  subject                   = "system:serviceaccount:platform-demo:workload-identity"
}


