# Azure Enterprise Landing Zone

A production-oriented Azure application landing zone built with Terraform. It shows how a platform team can give application teams a governed, secure, observable and repeatable Azure foundation without relying on manual portal configuration.

## What this project demonstrates

- Hub-and-spoke virtual networking
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Microsoft Entra integrated access
- AKS workload identity and OIDC
- Azure Key Vault
- Azure Monitor and Log Analytics
- Azure Policy integration for AKS
- Terraform-based infrastructure delivery
- GitHub Actions validation and OIDC-ready deployment
- Environment isolation and consistent tagging
- Cost-aware validation and clean teardown
- Architecture decisions, operational runbooks and deployment evidence

## Architecture

```text
GitHub -> OIDC -> Microsoft Entra ID -> Azure Subscription
                                      |
                                      +-- Hub Resource Group
                                      |    +-- Hub VNet
                                      |
                                      +-- Workload Resource Group
                                           +-- Spoke VNet
                                           |    +-- AKS subnet
                                           |    +-- Private endpoint subnet
                                           +-- AKS
                                           |    +-- Entra RBAC
                                           |    +-- Workload Identity
                                           |    +-- Azure CNI Overlay
                                           |    +-- Autoscaling
                                           +-- ACR
                                           +-- Key Vault
                                           +-- Log Analytics
```

The initial deployment deliberately avoids high-cost always-on components such as Azure Firewall and Application Gateway. Those controls are documented as production expansion points instead of being left running only for portfolio evidence.

## Deployment lifecycle

```text
Design -> Validate -> Security review -> Plan -> Deploy -> Verify
      -> Failure/recovery testing -> Evidence -> Destroy -> Cost check
```

Infrastructure is managed from code with a controlled validation lifecycle. The repository remains the reproducible source of truth for architecture, delivery and operations.

## Status

**Live-validated project evidence**

The project captures a live-validated Azure landing-zone implementation path with Terraform validation, CI checks, architecture decisions, operational runbooks and cost-controlled delivery evidence.

## Safety boundary

This project is isolated from the existing OpsChugex production environment. It does not modify or depend on the Lightsail instance that currently hosts the live website and application.
