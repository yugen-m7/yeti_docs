# Network Configuration

## WiFi Network Settings

Configure WiFi connection parameters and IP settings.

### Request

```http
POST /settings?wifi=1
Content-Type: application/json
```

### Request Body

```json
{
    "ssid": "PLANT_NETWORK",
    "pass": "wifi_password123",
    "wifi_dhcp": true,
    "wifi_ip": "192.168.50.100",
    "wifi_gw": "192.168.50.1",
    "wifi_nm": "255.255.255.0"
}
```

**Request Body Fields:**

| Field     | Type    | Description                                      |
| --------- | ------- | ------------------------------------------------ |
| ssid      | string  | WiFi network name                                |
| pass      | string  | WiFi password                                    |
| wifi_dhcp | boolean | Enable DHCP (true) or static IP (false)          |
| wifi_ip   | string  | Static IP address (required if wifi_dhcp=false)  |
| wifi_gw   | string  | Gateway IP address (required if wifi_dhcp=false) |
| wifi_nm   | string  | Subnet mask (required if wifi_dhcp=false)        |

### Response Messages

| Status | Message                             |
| ------ | ----------------------------------- |
| 200    | "WiFi settings saved successfully!" |
| 400    | "Invalid IP address format"         |
| 500    | "Failed to save WiFi settings"      |

---

## Ethernet Network Settings

Configure Ethernet interface IP settings.

### Request

```http
POST /settings?ethernet=1
Content-Type: application/json
```

### Request Body

```json
{
    "eth_dhcp": false,
    "eth_ip": "10.0.1.50",
    "eth_gw": "10.0.1.1",
    "eth_nm": "255.255.255.0"
}
```

**Request Body Fields:**

| Field    | Type    | Description                                     |
| -------- | ------- | ----------------------------------------------- |
| eth_dhcp | boolean | Enable DHCP (true) or static IP (false)         |
| eth_ip   | string  | Static IP address (required if eth_dhcp=false)  |
| eth_gw   | string  | Gateway IP address (required if eth_dhcp=false) |
| eth_nm   | string  | Subnet mask (required if eth_dhcp=false)        |

### Response Messages

| Status | Message                                 |
| ------ | --------------------------------------- |
| 200    | "Ethernet settings saved successfully!" |
| 400    | "Invalid IP address format"             |
| 500    | "Failed to save Ethernet settings"      |

---

## mDNS Configuration

Configure network discovery hostname.

### Request

```http
POST /settings?mdns=1
Content-Type: application/json
```

### Request Body

```json
{
    "mdns_host": "yeti-pro-accc"
}
```

**Request Body Fields:**

| Field     | Type   | Description                         |
| --------- | ------ | ----------------------------------- |
| mdns_host | string | mDNS hostname for network discovery |

### Response Messages

| Status | Message                             |
| ------ | ----------------------------------- |
| 200    | "mDNS settings saved successfully!" |
| 400    | "Invalid hostname format"           |
| 500    | "Failed to save mDNS settings"      |
