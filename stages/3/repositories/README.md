# repositories

This setups the repositories inside the GitHub organization, and all related settings.

## Inputs

You must provide the following environment variables:

### `GITHUB_TOKEN`

A GitHub Personal Access Token (PAT) with the following permissions:

- Repository access: All repositories
- Repository permissions
  - Administration: Read and write
  - Commit statuses: Read and write
  - Contents: Read and write
  - Issues: Read and write
  - Metadata: Read-only
- Organization permissions
  - Secrets: Read and write

Created once manually, on [this page](https://github.com/settings/tokens?type=beta).
From this moment forward, available as a GitHub Organization secret.