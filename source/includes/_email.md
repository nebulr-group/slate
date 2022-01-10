# Emails
The email endpoints gathers useful calls regarding sending emails and creation of identities.

## Creating an email address identity for AWS SES
Before you can send an email, you must create and verify identity that you're going to use as a "From" address. Verifying an identity with Amazon SES confirms that you own it and helps prevent unauthorized use.

To verify an email address check the inbox of the email address used to create your identity and look for an email from no-reply-aws@amazon.com. Open the email and click the link to complete the verification process for the email address. After it's complete, the Identity status updates to Verified. The link in the verification email expires after 24 hours.

```typescript
const response = await client.communication.awsSesIdentity({action: 'CREATE', EmailIdentity: 'identity@example.com'});
```

```shell
curl --request POST 'https://account-api.nebulr-core.com/communication/email/awsSesIdentity' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "action": "CREATE",
    "EmailIdentity": "identity@example.com"
}'
```

> The above command returns JSON structured like this:

```json
{
    "result": {
        "$metadata": {
            "httpStatusCode": 200,
            "requestId": "3191b1c7-ab55-4e0c-a267-0eefabcdde5d",
            "attempts": 1,
            "totalRetryDelay": 0
        },
        "IdentityType": "EMAIL_ADDRESS",
        "VerifiedForSendingStatus": false
    }
}
```

## Get an email address identity data
Provides information about a specific identity, including the identity's verification status

```typescript
const response = await client.communication.awsSesIdentity({action: 'GET', EmailIdentity: 'identity@example.com'});
```

```shell
curl --request POST 'https://account-api.nebulr-core.com/communication/email/awsSesIdentity' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "action": "GET",
    "EmailIdentity": "identity@example.com"
}'
```

> The above command returns JSON structured like this:

```json
{
    "result": {
        "$metadata": {
            "httpStatusCode": 200,
            "requestId": "f768ce85-413c-4c52-b99c-eff5c42ccc14",
            "attempts": 1,
            "totalRetryDelay": 0
        },
        "DkimAttributes": {
            "NextSigningKeyLength": "RSA_1024_BIT",
            "SigningAttributesOrigin": "AWS_SES",
            "SigningEnabled": false,
            "Status": "NOT_STARTED"
        },
        "FeedbackForwardingStatus": true,
        "IdentityType": "EMAIL_ADDRESS",
        "MailFromAttributes": {
            "BehaviorOnMxFailure": "USE_DEFAULT_VALUE"
        },
        "Policies": {},
        "Tags": [],
        "VerifiedForSendingStatus": false
    }
}
```

## Delete an email address identity data
Deletes an email identity.

```typescript
const response = await client.communication.awsSesIdentity({action: 'DELETE', EmailIdentity: 'identity@example.com'});
```

```shell
curl --request POST 'https://account-api.nebulr-core.com/communication/email/awsSesIdentity' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "action": "DELETE",
    "EmailIdentity": "identity@example.com"
}'
```

> The above command returns JSON structured like this:

```json
{
     "result": {
        "$metadata": {
            "httpStatusCode": 200,
            "requestId": "3ac6df79-6179-4f93-9cc3-f5d2162dd20a",
            "attempts": 1,
            "totalRetryDelay": 0
        }
    }
}
```

## Get an email address verified status
Deletes an email identity.

```typescript
const response = await client.communication.awsSesIdentity({action: 'VERIFIED_STATUS', EmailIdentity: 'identity@example.com'});
```

```shell
curl --request POST 'https://account-api.nebulr-core.com/communication/email/awsSesIdentity' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "action": "VERIFIED_STATUS",
    "EmailIdentity": "identity@example.com"
}'
```

> The above command returns JSON structured like this:

```json
{
    "verifiedStatus": false
}
```


## Send Email

```typescript
const response = await client.communication.email({action: 'VERIFIED_STATUS', EmailIdentity: 'identity@example.com'});
```

```shell
curl --request POST 'https://account-api.nebulr-core.com/communication/email/awsSesIdentity' \
--header 'x-api-key: API_KEY' \
--data-raw '{
    "to": "recepient@example.com",
    "emailTitle": "Email from My App",
    "emailBody": "<html><head></head><body><h1>New Email</h1><p>Text of email</p></body></html>"
}'
```

> The above command returns JSON structured like this:

```json
{
    "id": "0102017e438bd1a9-b4584bd0-803e-49ea-b310-bdf336960851-000000"
}
```
