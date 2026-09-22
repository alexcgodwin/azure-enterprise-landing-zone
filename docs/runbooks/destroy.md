# Runbook: safe teardown

## Purpose

Remove only the resources created by this project after validation is complete.

## Preconditions

- Evidence has been captured.
- Required logs and screenshots have been exported.
- The active Azure subscription has been checked.
- The Terraform state belongs to this repository.
- No OpsChugex production resource is referenced by the plan.

## Procedure

```powershell
terraform plan -destroy -out destroy.tfplan
terraform show destroy.tfplan
terraform apply destroy.tfplan
```

After Terraform completes, verify in Azure that both project resource groups are gone and inspect the subscription for leftover disks, public IPs, load balancers, snapshots and other billable resources.

## Guardrail

Never run a destroy operation from the OpsChugex production repository, production Lightsail host, or against unrelated Azure state.
