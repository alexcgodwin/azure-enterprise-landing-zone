# Azure Enterprise Landing Zone

A production-oriented Azure platform foundation built with Terraform. It demonstrates governed networking, identity, security, observability and Kubernetes capabilities through repeatable infrastructure delivery.

## What I Built

- Hub-and-spoke networking with separated platform and workload responsibilities.
- AKS, ACR, Microsoft Entra access, workload identity, Key Vault and monitoring.
- Terraform modules, GitHub Actions validation and OIDC-ready cloud access.
- Architecture decisions, operational notes, validation evidence and cost controls.

## Delivery Workflow

1. Define the foundation as versioned Terraform.
2. Run formatting, validation and security-oriented checks.
3. Review identity, network, secrets and monitoring boundaries.
4. Provision and verify the platform capabilities.
5. Capture evidence and remove validation resources when complete.

## Repository Structure

| Path | Purpose |
| --- | --- |
| `terraform/` | Landing-zone modules and environment configuration. |
| `modules/` | Reusable infrastructure components. |
| `docs/` | Architecture decisions and runbooks. |
| `scripts/` | Validation and deployment helpers. |

## Validation

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate.ps1
```

## Completed Result

A live-validated, reviewable Azure foundation with CI checks, identity and security controls, operating evidence and cost-aware delivery. It is isolated from OpsChugex production.

## Engineering Value

This project demonstrates platform ownership, governance, repeatability, security boundaries and evidence-led cloud delivery.