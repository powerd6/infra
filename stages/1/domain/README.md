# domain

This setups the Domain, Nameservers and DNS records.

## Inputs

You must provide the following environment variables:

### `GANDI_KEY`

The API key from [gandi.net](https://gandi.net).

Fetched once from the page `https://account.gandi.net/en/users/<username>/security`.
 Note that it must be an API Key, and not a PAT.
 From this moment forward, available as a GitHub Organization secret.
