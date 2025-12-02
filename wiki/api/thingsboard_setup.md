# ThingsBoard Cloud Integration

## MQTT Connection Setup

Configure a secure MQTT connection to the ThingsBoard cloud platform.

### Request

```http
POST /settings?thingsboard=1
Content-Type: application/json
```

### Request Body

```json
{
    "tb_uri": "mqtts://152.42.209.180",
    "tb_port": 8883,
    "tb_qos": 1,
    "tb_root_ca": "-----BEGIN CERTIFICATE-----\nMIIDQTCCAimgAwIBAgI...\n-----END CERTIFICATE-----",
    "tb_device_cert": "-----BEGIN CERTIFICATE-----\nMIIDWjCCAkKgAwIBAgI...\n-----END CERTIFICATE-----",
    "tb_device_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG...\n-----END PRIVATE KEY-----"
}
```

**Request Body Fields:**

| Field          | Type    | Description                       |
| -------------- | ------- | --------------------------------- |
| tb_uri         | string  | MQTT broker URI                   |
| tb_port        | integer | MQTT port for secure connection   |
| tb_qos         | integer | Quality of Service level          |
| tb_root_ca     | string  | Root CA certificate in PEM format |
| tb_device_cert | string  | Device certificate in PEM format  |
| tb_device_key  | string  | Device private key in PEM format  |

### Response Messages

| Status | Message                               |
| ------ | ------------------------------------- |
| 200    | "Cloud settings saved successfully!"  |
| 400    | "Invalid certificate format"          |
| 500    | "Failed to save ThingsBoard settings" |
