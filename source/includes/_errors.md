# Errors

Nblocks uses the following errors to explain what went wrong. All APIs use this error schema.

| Error Code                                   | Error message                                                                                                                           |
| -------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| NBLOCKS_CONFLICT                             | You cannot have two users with the same email in the same tenant.                                                                       |
| NBLOCKS_USER_NOT_FOUND                       | User not found.                                                                                                                         |
| NBLOCKS_UNKNOWN_LOGIN_STRATEGY               | Unknown login strategy.                                                                                                                 |
| NBLOCKS_UNKNOWN_APP_ID                       | App Id is missing.                                                                                                                      |
| NBLOCKS_APP_UNAUTHORIZED_EXCEPTION           | App is unauthenticated. This usually means your APP API Key is not valid.                                                               |
| NBLOCKS_UNAUTHORIZED_EXCEPTION               | User is unathenticated. Please login first.                                                                                             |
| INVALID_MFA_CODE_EXCEPTION                   | The MFA code your provided is invalid or expired.                                                                                       |
| NBLOCKS_FORBIDDEN_EXCEPTION                  | You do not have access to this resource.                                                                                                |
| NBLOCKS_FEATURE_FORBIDDEN_EXCEPTION          | You do not have access to this feature.                                                                                                 |
| NBLOCKS_MISSING_CREDENTIALS                  | Missing required variables to authorize.                                                                                                |
| NBLOCKS_MISSING_USERNAME                     | Missing username.                                                                                                                       |
| NBLOCKS_MISSING_APP                          | Missing app.                                                                                                                            |
| NBLOCKS_WRONG_CREDENTIALS                    | Wrong user credentials.                                                                                                                 |
| NBLOCKS_INVALID_AUTH_TOKEN                   | Invalid auth token.                                                                                                                     |
| NBLOCKS_INVALID_ROLE                         | The role you're changing to are not within your defined app roles.                                                                      |
| NBLOCKS_OWNER_ROLE_MUST_EXIST                | Your app must have the role OWNER.                                                                                                      |
| NBLOCKS_NOT_FOUND_TENANT_EXCEPTION           | Tenant do not exists                                                                                                                    |
| NBLOCKS_MISSING_REQUIRED_VARIABLES_EXCEPTION | You're missing some required variables or the ones you've provided are not formated correctly                                           |
| NBLOCKS_INVALID_OAUTH_SCOPE_ERROR            | The scope requested are not allowed for this client                                                                                     |
| NBLOCKS_INVALID_REDIRECT_URI_ERROR           | Invalid redirect_uri                                                                                                                    |
| NBLOCKS_INVALID_GRANT_TYPE_ERROR             | Unsupported grant_type                                                                                                                  |
| NBLOCKS_INVALID_RESPONSE_TYPE_ERROR          | Unsupported response_type                                                                                                               |
| NBLOCKS_STRIPE_OUT_OF_SYNC_EXCEPTION         | It seems that the the data in your stripe account don't match your business model. Update your business model to resync the integration |
| NBLOCKS_ERROR                                | An error occured. Please try again                                                                                                      |
