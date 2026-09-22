# Security model

## Identity first

The project avoids static cloud credentials as a design principle.

- GitHub deployment workflows are designed for OpenID Connect federation.
- AKS uses Microsoft Entra authentication and Azure RBAC.
- Kubernetes local accounts are disabled.
- Workloads use Microsoft Entra Workload ID instead of client secrets.
- ACR administrative credentials are disabled.

## Secrets

Azure Key Vault uses RBAC authorization. The workload managed identity receives only the `Key Vault Secrets User` role at the vault scope.

The Key Vault public endpoint is disabled and a private endpoint is created inside the workload spoke.

## Network

The AKS control plane is private by default. The cluster uses Azure CNI Overlay and a Cilium data plane. The node subnet has a dedicated NSG and the private endpoint subnet is separated from the node subnet.

## Governance

Resources receive consistent ownership, environment, management and cost-control tags. Azure Policy is enabled for AKS.

Subscription-level policy assignments and management-group controls are future expansion because they require tenant-level permissions that should not be assumed.

## Evidence standard

A control is not marked verified simply because Terraform contains it. Evidence is added only after deployment and validation show that the control is working as intended.
