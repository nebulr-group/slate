---
title: nBlocks API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - typescript
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
    - app
    - auth
    - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the nBlocks API
---

# Welcome to nBlocks Api Docs

This documentation describes the all functionalty available through the HTTP REST api and the available low level clients that wraps this functionality for different programming languages.

If you wish to go back to the high level and plug-n-play documentation click [here](https://nebulr-group.github.io/nblocks-docs)

# Authentication
All calls to nBlocks api requires you to authorize yourself as a valid app. You should have received an App secret when upon registration.

> To authorize, use this code:

```typescript
// With the typescript library you initate the client by providing the secret
const client = new PlatformClient("API_KEY");
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  --header "Authorization: API_KEY"
```

> Make sure to replace `API_KEY` with your API key.

<aside class="success">
In all future request examples, we assume you've instanciated the client prior to making the call.
</aside>