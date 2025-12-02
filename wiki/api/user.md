# User Account Management

## Update User Credentials

Change username and password for device access.

### Request

```http
POST /settings?user=1
Content-Type: application/json
```

### Request Body

```json
{
    "newUsername": "yeti-pro-admin",
    "oldPassword": "accc",
    "newPassword": "NewSecurePass123!"
}
```

**Request Body Fields:**

| Field       | Type   | Description                          |
| ----------- | ------ | ------------------------------------ |
| newUsername | string | New login username for device access |
| oldPassword | string | Current password for verification    |
| newPassword | string | New password to set                  |

### Response Messages

| Status | Message                               |
| ------ | ------------------------------------- |
| 200    | "User settings updated successfully!" |
| 400    | "Password validation failed"          |
| 401    | "Current password incorrect"          |
