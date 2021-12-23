# Auth
The auth endpoints gathers useful calls regarding authentications and authorisations.

## Authenticate
Authenticates a user by creating a new session. Returns a session token to be used in all user <-> app interactions. No app or tenant context required

```typescript
const response = await client.auth.authenticate({username: 'Danny12@hotmail.com', password: 'jrHXLA1ImkM4HkD'}, "Chrome....");
```

```shell
curl --request POST 'https://account-api.nebulr-core.com/auth/authenticate' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "username": "john.doe@example.com", 
    "password": "jrHXLA1ImkM4HkD"
}'
```

> The above command returns JSON structured like this:

```json
{
  "token": "cb183ef3d6137254bda9114c41c6decaf8483f6b57927a54a8419f6c9837ad30"
}
```

### HTTP Request

`POST https://account-api.nebulr-core.com/auth/authenticate`




## Authenticated
Check if a user session token is valid.

```typescript
const response = await client.auth.authenticated(authToken)
```

```shell

```

> The above command returns JSON structured like this:

```json
{
}
```

### HTTP Request

`POST https://account-api.nebulr-core.com/auth/authenticated`




## Deauthenticate
Destroys the session and all auth contexts stored in that session.

```typescript
const response = await client.auth.authenticated(authToken);
```

```shell
```

> The above command returns JSON structured like this:

```json
{
}
```

### HTTP Request

`POST https://account-api.nebulr-core.com/auth/deauthenticate`



## Forgot password
Initiates the reset password process. Will send an email to user with a link to set a new password. The link will be constructed using {appUrl}/auth/set-password/XXXX

See Update password for how to update the password. 

```typescript
await client.auth.forgotPassword("john.doe@example.com");
```

```shell
```

### HTTP Request

`POST https://account-api.nebulr-core.com/auth/password`



## Update password
Update users password with a new one. You must provide a valid reset token that the user has received from a forgot password email.

```typescript
await client.auth.updatePassword({
    password: "superSecretPassword",
    token: "XXXXXX"
});
```

```shell
```

### HTTP Request

`PUT https://account-api.nebulr-core.com/auth/password`



## List tenant users
Lists all tenant users (e.g. user profiles) this user can identify as to become fully authenticated. Each tenant user will represent the user for a different tenant in the app.

For a user to successfully make calls to apps where the app needs to authorise this user for a required privilege before continuing, the user must also provide the tenant user context.
TenantUsers binds a user with a session token to a specific tenant within an app. All user calls to apps needs to have the context of a tenant. Use this endpoint to present the user to the available identies to take for this app.

```typescript
const response = await client.auth.listTenantUsers(authToken);
```

```shell
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": "605b603cfeb49f00082686b8",
    "role": "OWNER",
    "email": "john.doe@example.com",
    "username": "john.doe@example.com",
    "fullName": "John Doe",
    "onboarded": true,
    "tenant": {
      "id": "605b603cfeb49f00082686b7",
      "name": "Monsters Inc",
      "locale": "en"
    }
  },
  {
    "id": "605b603cfeb49f00082686be",
    "role": "ADMIN",
    "email": "john.doe@example.com",
    "username": "john.doe@example.com",
    "fullName": "John Doe",
    "onboarded": true,
    "tenant": {
      "id": "605b603cfeb49f00082686bd",
      "name": "Cheetah AB",
      "locale": "sv"
    }
  }
]
```

### HTTP Request

`POST https://account-api.nebulr-core.com/auth/listTenantUsers`




## Update user info
Updates users name and contact information. Should be a part of the user onboarding.

```typescript
const response = await client.auth.updateUser({
    authToken, 
    firstName: "John", 
    lastName: "Doe"
});
```

```shell
```


### HTTP Request

`PUT https://account-api.nebulr-core.com/auth/user`




## Authorize a user
Authorizes a user for a given privilege. This is a central endpoint for your app to use and authorize a user for specific action. User must have selected TenantUser id. Endpoint returns current tenant id and other useful information that can be used to allow further propagation in app.

The configured app roles and privileges plays a central role in the authorizing process.

The result is a JSON containing both a user instance and if the user is granted the action or not

```typescript
const response = await client.auth.authorize(authToken, tenantUserId, 'USER_READ');
```

```shell
```

> The above command returns JSON structured like this:

```json
{
  "granted": true,
  "user": {
    "id": "605b603cfeb49f00082686b8",
    "role": "OWNER",
    "email": "oscar@nebulr.group",
    "username": "oscar@nebulr.group",
    "fullName": "Oscar Söderlund",
    "onboarded": true,
    "tenant": {
      "id": "605b603cfeb49f00082686b7",
      "name": "Monsters Inc",
      "locale": "en"
    }
  }
}
```

### HTTP Request

`POST https://account-api.nebulr-core.com/auth/authorize`