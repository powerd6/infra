# powerd6/infrastructure

This repository contains the infrastructure-as-code (IaC) for the powerd6 project.

This project reflects the current state of the infrastructure, and can be used
to recover from a complete disaster (with some caveats).

## Structure

This project consists of two main parts: stages and modules.

### Stages

[![Terraform](https://github.com/powerd6/infrastructure/actions/workflows/terraform.yml/badge.svg?event=workflow_dispatch)](https://github.com/powerd6/infrastructure/actions/workflows/terraform.yml)

Stages are logical separation between systems based on the order they need to be
 provisioned in.

Stages are named with the following convention: `<order>/<name>`.

Stages with the same order can be executed in parallel.

Stages can only depend on stages that come before them (with a lower `order` number),
 and they do so by referencing the remote state. This means that anything that
 will be used by higher stages must be set as an output of the previous stages.

### Modules

Modules are repeatable packages of code that can be used in stages to abstract
some complexity.
