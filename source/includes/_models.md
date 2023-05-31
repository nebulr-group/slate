# Models
## App profile model

> Model example:

```json
{
    "id": "624c14cc0c01e70033356282",
    "name": "My app",
    "domain": "MY_APP",
    "apiUrl": "",
    "uiUrl": "http://localhost:8100",
    "stripeEnabled": true,
    "azureMarketplaceEnabled": false,
    "onboardingFlow": "B2B",
    "cloudViews": true,
    "redirectUris": ["http://localhost:8080/auth/oauth-callback"],
    "defaultCallbackUri": "http://localhost:8080/auth/oauth-callback",
    "defaultRole": "OWNER",
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
            "GROUP_READ",
            "ASSIGNEES_WRITE",
            "SETTINGS_READ",
            "SETTINGS_WRITE"
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
            "GROUP_READ",
            "ASSIGNEES_WRITE",
            "SETTINGS_READ",
            "SETTINGS_WRITE"
        ],
        "MANAGER": [
            "TENANT_READ",
            "CASE_READ",
            "CASE_WRITE",
            "TAG_READ",
            "USER_READ",
            "GROUP_READ",
            "SETTINGS_READ"
        ],
        "VIEWER": [
            "TENANT_READ",
            "CASE_READ",
            "TAG_READ",
            "USER_READ",
            "GROUP_READ",
            "SETTINGS_READ"
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
            "trialDays": 14,
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
            }
        ]
    },
    "logo": "https://public.nblocks.dev/assets/logos/nblocks-logo-purple.png",
    "websiteUrl": "http://localhost",
    "privacyPolicyUrl": "",
    "termsOfServiceUrl": ""
}
```

| Parameter               | Type                     | Description                                                                                                                                                |
| ----------------------- | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                      | string                   | Unique ID (Read only)                                                                                                                                      |
| name                    | string                   | Name of the app                                                                                                                                            |
| domain                  | string                   | Unique domain name of the app (Read only)                                                                                                                  |
| apiUrl                  | string                   | URL to your api (to receive webhooks etc). **Must be HTTPS**                                                                                               |
| defaultRole             | string                   | Default user role                                                                                                                                          |
| uiUrl                   | string                   | URL to your frontend app (for onboarding redirects etc). **Must be HTTPS**                                                                                 |
| roles                   | Record<string, string[]> | All user roles and their granted privileges                                                                                                                |
| businessModel           | [BusinessModel](#business-model)            | The business model defines what plans are available to subscribe to and what taxes applies.                                                                |
| logo                    | string                   | URL to your logo                                                                                                                                           |
| websiteUrl              | string                   | URL to your website or landing page. E.g. Branded emails will link to this URL, checkout process will redirect to `/payment-success` and `/payment-cancel` |
| privacyPolicyUrl        | string                   | URL to a page on your website containing a Privacy policy for your app users. E.g. checkout process will link to this url.                                 |
| termsOfServiceUrl       | string                   | URL to a page on your website containing a Terms of service for your app users. E.g. checkout process will link to this url.                               |
| emailSenderName         | string                   | Emails sent from Nblocks will have this sender name                                                                                                        |
| emailSenderEmail        | string                   | Emails sent from Nblocks will have this sender email. You'll have to verify this email before                                                              |
| stripeEnabled           | boolean                  | Boolean value telling the user if Stripe is enabled (Read only)                                                                                            |
| azureMarketplaceEnabled | boolean                  | Boolean value telling the user if Azure marketplace is enabled (Read only)                                                                                 |
| onboardingFlow          | OnboardingFlow           | Configure how users will be onboarded                                                                                                                      |
| cloudViews              | boolean                  | Toggle this to true if you want to use a UI provided by NBlocks instead of your own                                                                        |
| redirectUris            | string[]                 | Allowed redirect uris                                                                                                                                      |
| defaultCallbackUri      | string                   | Default handover/callback uri used by Nblocks                                                                                                              |

## Business model

> Model example:

```json
{
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
            "trialDays": 14,
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
            }
        ]
}
```

| Parameter | Type   | Description                                           |
| --------- | ------ | ----------------------------------------------------- |
| taxes     | Tax[]  | A list of Taxes for different countries               |
| plans     | Plan[] | A list of Plans which your customers can subscribe to |


## Tenant model

```json
{
    "id": "624c14cc0c01e70033356285",
    "plan": "TEAM",
    "mfa": false,
    "paymentsEnabled": false,
    "paymentsRequired": false,
    "locale": "en",
    "name": "Nebulr AB",
    "logo": "https://nebulr-group.github.io/nblocks-docs/img/logo.png",
    "metadata": {},
    "onboarded": true,
    "createdAt": "2022-04-05T10:07:08.235Z"
}
```

| Parameter        | Type                   | Description                                                                                                                                    |
| ---------------- | ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| id               | string                 | Unique ID (Read only)                                                                                                                          |
| plan             | string                 | Name of the subscription plan. Automatically set by the payment service if tenant used the checkout process                                    |
| locale           | string                 | The default locale / lang code for all users in this tenant (`ISO_639-1` format). This property will set the i18n for all platform emails      |
| name             | string                 | Name of the tenant                                                                                                                             |
| logo             | string                 | URI to a logo                                                                                                                                  |
| mfa              | boolean                | Require users to login with MFA/2FA                                                                                                            |
| paymentsEnabled  | boolean                | The tenant has been setup with a payment solution                                                                                              |
| paymentsRequired | boolean                | The tenant should setup payment immediately because tenant has not setup payments and the subscribing plan carry a cost or the trial has ended |
| metadata         | Record<string, string> | Custom key value meta data that you can use                                                                                                    |
| onboarded        | string                 | If this tenant is considered onboarded (Read only)                                                                                             |
| createdAt        | string                 | Timestamp when created (Read only)                                                                                                             |

## Tokens response
| Parameter     | Type   | Description                                                                                         |
| ------------- | ------ | --------------------------------------------------------------------------------------------------- |
| token_type    | string | Token type                                                                                          |
| expires_in    | number | Seconds before the access_token expires                                                             |
| access_token  | string | (JWT) The access token containing authentication and access control data only)                      |
| refresh_token | string | (JWT) The token use for refreshing the access token before it expires app                           |
| id_token      | string | (JWT) The OpenId Connect user profile id                                                            |
| user_profile  | object | A decoded id_token JWT as JSON. Available in [Shorthand get tokens](#shorthand-get-tokens) endpoint |


## Access token model

```json
{
  "sub": "63d25a9e0796d40008680f9a",
  "scope": "TENANT_WRITE TENANT_READ USER_WRITE USER_READ AUTHENTICATED",
  "role": "OWNER",
  "aid": "624c14cc0c01e70033356282",
  "tid": "63d25a9e0796d40008680f96",
  "plan": "Basic"
}
```

Decoded JWT payload.

| Parameter | Type   | Description      |
| --------- | ------ | ---------------- |
| sub       | string | User id          |
| scope     | string | User privileges  |
| role      | string | User role        |
| aid       | string | Your app id      |
| tid       | string | User tenant id   |
| plan      | string | User tenant plan |

## Id token model

```json
{
  "sub": "63d25a9e0796d40008680f9a"
  "name": "John Doe",
  "family_name": "Doe",
  "given_name": "John",
  "preferred_username": "john@example.com",
  "locale": "en",
  "email": "john@example.com",
  "email_verified": true,
  "onboarded": true,
  "tenant_id": "63d25a9e0796d40008680f96",
  "tenant_name": "Johns Family",
  "tenant_locale": "en",
  "tenant_logo": "",
}
```

Decoded JWT payload.

| Parameter          | Type    | Description                               |
| ------------------ | ------- | ----------------------------------------- |
| sub                | string  | User id                            |
| name               | string  | Users full name                           |
| family_name        | string  | Users last name                           |
| given_name         | string  | Users first name                          |
| preferred_username | string  | Username                                  |
| locale             | string  | Users preferred locale                    |
| email              | string  | User email                                |
| email_verified     | boolean | The users email address has been verified |
| onboarded          | boolean | Have the user completed onboarding or not |
| tenant_id          | string  | Tenant id                                 |
| tenant_name        | string  | Tenant name                               |
| tenant_locale      | string  | The preferred locale of the whole tenant  |
| tenant_logo        | string  | Tenant logo URI                           |