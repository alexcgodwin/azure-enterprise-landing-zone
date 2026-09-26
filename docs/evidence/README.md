# Azure Enterprise Landing Zone Evidence

This folder records the validation and teardown proof for the Azure Enterprise Landing Zone project.

## Validation Result

The landing zone was deployed long enough to prove the design and then destroyed immediately for cost control.

## Evidence Captured

| Evidence | Result |
| --- | --- |
| Terraform plan | 24 resources planned. |
| AKS cluster | Reached `Succeeded` during validation. |
| Terraform state before destroy | 24 managed resources. |
| Terraform destroy | Completed successfully. |
| Destroy result | 24 resources destroyed. |
| Azure resource groups after destroy | Only `NetworkWatcherRG` remained. |
| Terraform state after destroy | Empty state list. |

## What The Project Proves

- Hub-and-spoke Azure landing zone design.
- Private AKS deployment pattern.
- Azure Container Registry integration.
- Key Vault and workload identity pattern.
- Log Analytics and diagnostic settings.
- Terraform-controlled lifecycle and teardown discipline.

## Cost-Control Notes

This project used the Free Trial validation approach. Resources were not left running after proof capture.

## Interview Talking Points

- Why private AKS matters for enterprise environments.
- How hub-and-spoke networking supports segmentation.
- Why workload identity is preferred over static secrets.
- How Terraform state and destroy output prove lifecycle control.
- What would change for a long-running production platform.
