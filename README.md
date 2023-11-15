# powerd6/infrastructure

This repository contains the infrastructure-as-code (IaC) for the powerd6 project.

This project reflects the current state of the infrastructure, and can be used to recover from a complete disaster (with some caveats).

## Structure

This project consists of two main parts: stages and modules.

Stages are executable bits of IaC that need to be provisioned in a specific order.

Modules are repetable packages of code that can be used in stages to abstract some complexity.