# Cost control

This repository is designed for temporary validation, not permanent portfolio hosting.

## Default cost controls

- No Azure Firewall
- No Application Gateway
- No NAT Gateway
- ACR Standard instead of Premium
- One autoscaled AKS system pool by default
- Optional user node pool disabled by default
- 30-day Log Analytics retention
- Terraform-managed teardown

## Workflow

1. Run validation and security checks.
2. Review the Terraform plan.
3. Deploy only for the test window.
4. Capture evidence.
5. Run recovery and operational tests.
6. Destroy the project resources.
7. Verify that no billable resources remain.

## Important

`terraform destroy` is not treated as the final proof of cleanup. Azure resource groups and billable resources must also be checked after destroy.

The existing OpsChugex production Lightsail environment is outside this project and must never be targeted by these Terraform configurations.
