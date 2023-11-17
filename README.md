# powerd6/infrastructure

This repository contains the infrastructure-as-code (IaC) for the powerd6 project.

This project reflects the current state of the infrastructure, and can be used
to recover from a complete disaster (with some caveats).

## Structure

This project consists of two main parts: stages and modules.

### Stages

[![Terraform](https://github.com/powerd6/infrastructure/actions/workflows/terraform.yml/badge.svg?event=workflow_dispatch)](https://github.com/powerd6/infrastructure/actions/workflows/terraform.yml)

Stages are logical separation between systems, and can be, at first-glance,
 provisioned individually.

Stages can only use environment variables or the outputs of other stages as input.

### Modules

Modules are repeatable packages of code that can be used in stages to abstract
some complexity.
