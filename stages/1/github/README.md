# github

This setups the GitHub organization and it's repositories.

## Inputs

You must provide the following environment variables:

### `PG_CONN_STR`

The elephantSQL API key. Fetched locally once, then saved to GitHub Organization
 secrets for future use.

Fetched once from stage 0, with the following command: `tofu output -raw elephantsql_api_key`.
From this moment forward, available as a GitHub Organization secret.

### `GITHUB_TOKEN`

A GitHub Personal Access Token (PAT) with the following permissions:

<!-- TODO: Check if all these permissions are required. -->
- Repository access: All repositories
- Repository permissions
  - Administration: Read and write
  - Commit statuses: Read and write
  - Contents: Read and write
  - Issues: Read and write
  - Metadata: Read-only
- Organization permissions
  - Administration: Read and write
  - Members: Read and write
  - Secrets: Read and write

Created once manually, on [this page](https://github.com/settings/tokens?type=beta).
From this moment forward, available as a GitHub Organization secret.