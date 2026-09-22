# Architecture

## Design goal

The platform separates shared connectivity from workload infrastructure and gives the AKS workload controlled identity, private secret access, central telemetry and a repeatable infrastructure lifecycle.

## Platform boundary

The project creates two resource groups:

- **Hub**: shared network foundation.
- **Workload**: spoke network, AKS, container registry, Key Vault, managed identity and monitoring.

The hub and spoke VNets are peered. The design leaves room for centralized DNS, firewall, VPN/ExpressRoute and shared services without forcing those higher-cost services into the temporary validation environment.

## AKS design

AKS uses:

- Microsoft Entra integration and Azure RBAC
- local accounts disabled
- OIDC issuer
- Microsoft Entra Workload ID
- Azure Policy integration
- Azure CNI Overlay
- Cilium data plane
- autoscaling
- private API endpoint by default
- Azure Monitor integration
- Key Vault Secrets Provider

A user-assigned managed identity is federated to a Kubernetes service account. Workloads can use that identity to access Key Vault without a client secret stored in Kubernetes or GitHub.

## Network design

```text
10.20.0.0/16  Hub VNet
       |
       | VNet peering
       |
10.30.0.0/16  Spoke VNet
       |
       +-- 10.30.0.0/20   AKS nodes
       +-- 10.30.16.0/24  Private endpoints
```

The Kubernetes service network uses `10.40.0.0/16`, which does not overlap the VNet address spaces.

## Production expansion points

- Azure Firewall or a centralized secured virtual hub
- DDoS Network Protection
- private ACR endpoint using Premium SKU
- centralized private DNS
- VPN/ExpressRoute connectivity
- Application Gateway/WAF or another approved ingress pattern
- management groups and subscription vending
- organization-wide Azure Policy initiatives
- Defender for Cloud
- backup policy and multi-region recovery

These are intentionally not deployed by default because the portfolio validation environment is temporary and cost controlled.
