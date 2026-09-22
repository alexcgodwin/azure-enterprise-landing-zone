locals {
  name_prefix = "acg-${var.environment}"

  common_tags = {
    Project       = "azure-enterprise-landing-zone"
    Environment   = var.environment
    ManagedBy     = "Terraform"
    Owner         = var.owner
    CostControl   = "ephemeral-validation"
    ProductionUse = "reference-implementation"
  }

  hub_address_space         = ["10.20.0.0/16"]
  spoke_address_space       = ["10.30.0.0/16"]
  aks_subnet_prefix         = ["10.30.0.0/20"]
  private_endpoint_prefix   = ["10.30.16.0/24"]
  kubernetes_service_cidr   = "10.40.0.0/16"
  kubernetes_dns_service_ip = "10.40.0.10"
}
