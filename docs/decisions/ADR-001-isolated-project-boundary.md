# ADR-001: Isolate the portfolio platform from production

**Status:** Accepted

## Context

OpsChugex already has a live AWS environment. This project requires destructive testing, repeated provisioning and teardown.

## Decision

The Azure landing zone is deployed into separate Azure resources and Terraform state. It has no dependency on the existing production Lightsail server.

## Consequences

- Failure testing cannot affect the live website or application.
- Temporary Azure resources can be destroyed safely.
- Evidence from this project is clearly attributable to the project environment.
- Cross-cloud integration can be evaluated later without coupling the two environments.
