variable "subscription_id" {
  description = "Azure subscription used for the isolated project environment."
  type        = string
}

variable "location" {
  description = "Primary Azure region."
  type        = string
  default     = "canadacentral"
}

variable "environment" {
  description = "Environment identifier."
  type        = string
  default     = "validation"

  validation {
    condition     = contains(["validation", "dev", "staging", "prod"], var.environment)
    error_message = "environment must be validation, dev, staging, or prod."
  }
}

variable "owner" {
  description = "Resource ownership tag."
  type        = string
  default     = "alexcgodwin"
}

variable "private_cluster_enabled" {
  description = "Keep the AKS API endpoint private."
  type        = bool
  default     = true
}

variable "enable_user_node_pool" {
  description = "Create a separate autoscaled user workload node pool."
  type        = bool
  default     = false
}

variable "system_node_vm_size" {
  description = "VM size for the AKS system node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "user_node_vm_size" {
  description = "VM size for the optional user node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "key_vault_purge_protection" {
  description = "Enable purge protection for long-lived production Key Vaults."
  type        = bool
  default     = false
}

variable "purge_key_vault_on_destroy" {
  description = "Allow cleanup of soft-deleted Key Vaults in disposable validation environments."
  type        = bool
  default     = true
}
