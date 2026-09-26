# Deployment evidence

Verified deployment evidence is added here only after an intentional deployment has completed and the Azure control plane, Terraform state and operational checks agree.

A Terraform plan or partially created resource is not treated as proof of a successful deployment.

For each completed validation window, evidence should record:

- Terraform validation and plan result
- Azure resources actually created
- AKS provisioning and node health
- identity and RBAC checks
- private networking and Key Vault access checks
- ACR pull verification
- monitoring and diagnostic verification
- controlled failure or recovery result
- teardown result
- post-destroy check showing no project resources remain

**Current status:** no completed deployment evidence has been published yet.
