# Session Management

## User Login

Authenticate user for device configuration access.

### Request

```http
POST /login
Content-Type: application/json
```

### Request Body

```json
{
    "username": "yeti-pro-admin",
    "password": "accc"
}
```

**Request Body Fields:**

| Field    | Type   | Description                        |
| -------- | ------ | ---------------------------------- |
| username | string | User login name for authentication |
| password | string | User password for authentication   |

### Response Messages

| Status | Response              | Description               |
| ------ | --------------------- | ------------------------- |
| 200    | Redirect to dashboard | Authentication successful |
| 401    | Error message in UI   | Invalid credentials       |
| 500    | Error message in UI   | Server error              |

## User Logout

Terminate session and clear authentication.

### Request

```http
POST /logout
```

### Response Messages

| Status | Action                 |
| ------ | ---------------------- |
| 200    | Redirect to login page |
