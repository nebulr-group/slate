# Changelog

## May 2023
* Introduction of Azure AD SSO and Azure Marketplace integration.
* Trial support for your plans

`azureAdClientId`

### Affected APIs:
* <%= config[:auth_url] %>
* <%= config[:account_api_url] %>

## April 2023
Improving onboarding information

Adding the `onboarded` property to both `tenantUser` and `tenant` responses.

### Affected APIs:
* <%= config[:auth_url] %>
* <%= config[:account_api_url] %>

## March 2023
Brandable email templates

Enable developers to change the default email templates from the communication api to accomplish a fully customized branding.

`getEmailTemplate`, `overrideEmailTemplate`, `resetEmailTemplate`.

### Affected APIs:
* <%= config[:communication_api_url] %>

## February 2023
Launching Auth service, Backendless and Cloud views.

Auth service: Oauth 2.0 login, JWTs and callback/handover functionality.
Cloud views: Login flow so that any tech stack can use Nblocks login.
Backendless: Powers cloud views but also any Nblocks UI plugin.

Adding the `cloudviews` property to turn on/off this functionality to `app` profile.

### Affected APIs:
* <%= config[:auth_url] %>
* <%= config[:account_api_url] %>

## October 2022
PDF generation

### Affected APIs:
* <%= config[:file_api_url] %>
* <%= config[:pdf_api_url] %>

## September 2022
Cloud hosted checkout view for simpler integration with Stripe

* <%= config[:account_api_url] %>

### Affected APIs:

## August 2022
File storage meta data cleansing support

### Affected APIs:
* <%= config[:file_api_url] %>

## May 2022
Launching voice call redirect api.

Now you can expose a phone number and configure a rule set how and to which recipients this call should be routed to.

Adding `listVoiceRedirectRules`, `createVoiceRedirectRule`, `updateVoiceRedirectRule`, `deleteVoiceRedirectRule`, `listVoiceRedirectErrors`.

### Affected APIs:
* <%= config[:communication_api] %>

## February 2022
* MFA support

## January 2022
* Custom email sender
* Default role for new users

## December 2021
Soft launch