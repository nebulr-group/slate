---
title: API Reference Test

language_tabs: # must be one of https://git.io/vQNgJ
  - typescript
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Kittn API
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

# App

## Get app model
Gets the complete `App` model of your app.
The app is your top most entity and holds all configurations for how your App interacts with the platform in any sub call. 
Use this response data to alter your model and push back.

```typescript
const response = await client.getApp();
```

```shell
curl --request GET 'https://account-api.nebulr-core.com/app' \
--header 'x-api-key: API_KEY'
```

> The above command returns JSON structured like this:

```json
{
    "id": "605b603cfeb49f00082686b6",
    "name": "My App",
    "domain": "my_app",
    "apiUrl": "https://api.example.com",
    "uiUrl": "https://app.example.com",
    "roles": {
        "OWNER": [
            "TENANT_READ",
            "TENANT_WRITE",
            "CASE_READ",
            "CASE_WRITE",
            "TAG_READ",
            "TAG_WRITE",
            "USER_READ",
            "USER_WRITE",
            "GROUP_WRITE",
            "GROUP_READ"
        ],
        "ADMIN": [
            "TENANT_READ",
            "CASE_READ",
            "CASE_WRITE",
            "TAG_READ",
            "TAG_WRITE",
            "USER_READ",
            "USER_WRITE",
            "GROUP_WRITE",
            "GROUP_READ"
        ],
        "MANAGER": [
            "TENANT_READ",
            "CASE_READ",
            "CASE_WRITE",
            "TAG_READ",
            "USER_READ",
            "GROUP_READ"
        ],
        "VIEWER": [
            "TENANT_READ",
            "CASE_READ",
            "TAG_READ",
            "USER_READ",
            "GROUP_READ"
        ]
    },
    "businessModel": {
        "taxes": [
            {
                "region": "SE",
                "name": "VAT",
                "percentage": 25
            }
        ],
        "plans": [
            {
                "name": "ESSENTIAL",
                "prices": [
                    {
                        "region": "SE",
                        "amount": 500,
                        "currency": "SEK",
                        "recurrenceInterval": "month"
                    },
                    {
                        "region": "DE",
                        "amount": 50,
                        "currency": "EUR",
                        "recurrenceInterval": "month"
                    }
                ]
            },
            {
                "name": "TEAM",
                "prices": [
                    {
                        "region": "SE",
                        "amount": 1000,
                        "currency": "SEK",
                        "recurrenceInterval": "month"
                    },
                    {
                        "region": "DE",
                        "amount": 100,
                        "currency": "EUR",
                        "recurrenceInterval": "month"
                    }
                ]
            },
            {
                "name": "ENTERPRISE",
                "prices": [
                    {
                        "region": "SE",
                        "amount": 3000,
                        "currency": "SEK",
                        "recurrenceInterval": "month"
                    },
                    {
                        "region": "DE",
                        "amount": 300,
                        "currency": "EUR",
                        "recurrenceInterval": "month"
                    }
                ]
            }
        ]
    },
    "logo": "https://www.example.com/logo.png",
    "websiteUrl": "https://www.example.com",
    "privacyPolicyUrl": "https://www.example.com/privacy-policy",
    "termsOfServiceUrl": "https://www.example.com/terms-of-service"
}
```

### HTTP Request

`GET https://account-api.nebulr-core.com/app`

## Update app model
You can update the app with the same JSON you got from `Get app model` or just provide the field you want to update

```typescript
const response = await client.updateApp({logo: "https://www.example.com/another_logo.png"});
```

```shell
curl --request PUT 'https://account-api.nebulr-core.com/app' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "logo": "https://www.example.com/another_logo.png"
}'
```

> The above command returns JSON structured like this:

```json
{
    "id": "605b603cfeb49f00082686b6",
    "name": "My App",
    "domain": "my_app",
    "apiUrl": "https://api.example.com",
    "uiUrl": "https://app.example.com",
    "roles": {
        "OWNER": [
            "TENANT_READ",
            "TENANT_WRITE",
            "CASE_READ",
            "CASE_WRITE",
            "TAG_READ",
            "TAG_WRITE",
            "USER_READ",
            "USER_WRITE",
            "GROUP_WRITE",
            "GROUP_READ"
        ],
        "ADMIN": [
            "TENANT_READ",
            "CASE_READ",
            "CASE_WRITE",
            "TAG_READ",
            "TAG_WRITE",
            "USER_READ",
            "USER_WRITE",
            "GROUP_WRITE",
            "GROUP_READ"
        ],
        "MANAGER": [
            "TENANT_READ",
            "CASE_READ",
            "CASE_WRITE",
            "TAG_READ",
            "USER_READ",
            "GROUP_READ"
        ],
        "VIEWER": [
            "TENANT_READ",
            "CASE_READ",
            "TAG_READ",
            "USER_READ",
            "GROUP_READ"
        ]
    },
    "businessModel": {
        "taxes": [
            {
                "region": "SE",
                "name": "VAT",
                "percentage": 25
            }
        ],
        "plans": [
            {
                "name": "ESSENTIAL",
                "prices": [
                    {
                        "region": "SE",
                        "amount": 500,
                        "currency": "SEK",
                        "recurrenceInterval": "month"
                    },
                    {
                        "region": "DE",
                        "amount": 50,
                        "currency": "EUR",
                        "recurrenceInterval": "month"
                    }
                ]
            },
            {
                "name": "TEAM",
                "prices": [
                    {
                        "region": "SE",
                        "amount": 1000,
                        "currency": "SEK",
                        "recurrenceInterval": "month"
                    },
                    {
                        "region": "DE",
                        "amount": 100,
                        "currency": "EUR",
                        "recurrenceInterval": "month"
                    }
                ]
            },
            {
                "name": "ENTERPRISE",
                "prices": [
                    {
                        "region": "SE",
                        "amount": 3000,
                        "currency": "SEK",
                        "recurrenceInterval": "month"
                    },
                    {
                        "region": "DE",
                        "amount": 300,
                        "currency": "EUR",
                        "recurrenceInterval": "month"
                    }
                ]
            }
        ]
    },
    "logo": "https://www.example.com/logo.png",
    "websiteUrl": "https://www.example.com",
    "privacyPolicyUrl": "https://www.example.com/privacy-policy",
    "termsOfServiceUrl": "https://www.example.com/terms-of-service"
}
```

### HTTP Request

`PUT https://account-api.nebulr-core.com/app`

### Parameters

Parameter | Required | Description
--------- | ------- | -----------
name | false | Name of the app
apiUrl | false | URL to your api (to receive webhooks etc). **Must be HTTPS**
uiUrl | false | URL to your frontend app (for onboarding redirects etc). **Must be HTTPS**
roles | false | All user roles and their granted privileges
businessModel | false | The business model defines what plans are available to subscribe to and what taxes applies.
logo | false | URL to your logo
websiteUrl | false | URL to your website or landing page. E.g. Branded emails will link to this URL, checkout process will redirect to `/payment-success` and `/payment-cancel`
privacyPolicyUrl | false | URL to a page on your website containing a Privacy policy for your app users. E.g. checkout process will link to this url.
termsOfServiceUrl | false | URL to a page on your website containing a Terms of service for your app users. E.g. checkout process will link to this url

## Update credentials

```typescript
await client.updateAppCredentials({googleClientId: "XXXXXXX", googleClientSecret: "XXXXXXX"})
```

```shell
curl --request PUT 'https://account-api.nebulr-core.com/app' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "googleClientId": "XXXXXXX",
    "googleClientSecret": "XXXXXXX"
}'
```

Store sensitive credentials for your app so nBlocks can authorize with 3d party services on your behalf.

E.g. Stripe integration, social login providers like Google, Facebook, Github etc.

### HTTP Request

`PUT https://account-api.nebulr-core.com/app/credentials`

## Create a checkout session

```typescript
const response = await client.createCheckoutSession();
```

```shell
curl --request GET 'https://account-api.nebulr-core.com/app/<APP_ID>/checkout?plan=<PLAN_NAME>&region=<REGION_NAME>'
```

> The above command returns JSON structured like this:

```json
{
  "id": "cs_test_a1u23t2uvij7MPN6emEYTD3h6EKPyCJ2M3NdzLnLknwtVbnuMKqUFEPC57"
}
```

Create a checkout session with Stripe. Use the resulting session id to redirect users to Stripe Checkout using the Stripe SDK. https://stripe.com/docs/billing/subscriptions/checkout#add-redirect

Completing or canceling the checkout will have the user return to {app.websiteUrl}/payment-success or {app.websiteUrl}/payment-cancel

### HTTP Request

`GET https://account-api.nebulr-core.com/app/<APP_ID>/checkout?plan=<PLAN_NAME>&region=<REGION_NAME>`

### URL Parameters

Parameter | Description
--------- | -----------
APP_ID | The ID of your app
PLAN_NAME | The name of your place. Must be a valid plan from your app model
REGION_NAME | The name of the region. Must be a valid region from your plan.

<aside class="notice">
This request doesn't require you to authenticate with API_KEY. It can be used in the checkout process of a web page
</aside>

