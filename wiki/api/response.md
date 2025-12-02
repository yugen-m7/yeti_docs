# API Response Reference

## HTTP Status Codes

| Code | Meaning               | Description                                  |
| ---- | --------------------- | -------------------------------------------- |
| 200  | OK                    | Request processed successfully               |
| 400  | Bad Request           | Invalid request format or parameters         |
| 401  | Unauthorized          | Authentication required or session expired   |
| 404  | Not Found             | Endpoint does not exist                      |
| 409  | Conflict              | Resource conflict (e.g., duplicate slave ID) |
| 500  | Internal Server Error | Server-side processing error                 |

## Common Success Messages

### Network Configuration

- "WiFi settings saved successfully!"
- "Ethernet settings saved successfully!"
- "mDNS settings saved successfully!"

### Communication Settings

- "RTU settings saved successfully!"
- "TCP settings saved successfully!"

### Device Management

- "Modbus settings saved successfully!"

### Cloud Integration

- "Cloud settings saved successfully!"

### User Management

- "User settings updated successfully!"

## Common Error Messages

### Network Configuration Errors

- "Invalid IP address format"
- "Please enter valid IP addresses for WiFi/Ethernet"
- "Invalid hostname format"

### Communication Errors

- "Invalid communication parameters"
- "Response timeout must be between 100-2000 ms"
- "Port must be a number between 1 and 65535"

### Device Configuration Errors

- "Duplicate slave ID detected"
- "Invalid device configuration"
- "Slave ID must be a number between 0 and 255"
- "Please configure a valid Slave ID before adding registers"
- "Param Name must be 1 to 25 characters (quotes not allowed)"

### Certificate Errors

- "Invalid certificate format"
- "Root CA must be a valid PEM certificate"
- "Device certificate must be a valid PEM certificate"
- "Private key must be a valid PEM private key"

### Authentication Errors

- "Invalid credentials"
- "Password validation failed"
- "Current password incorrect"
