# Populate 

Verify session validity and populate configuration on web portal.

### Request

```http
GET /status
```

### Response

Returns the complete device configuration object:

```json
{
    "mdns_host": "yeti-device.local",
    "ssid": "NETWORK_NAME",
    "pass": "wifi_password",
    "wifi_dhcp": true,
    "wifi_ip": "192.168.1.100",
    "wifi_gw": "192.168.1.1",
    "wifi_nm": "255.255.255.0",
    "eth_dhcp": false,
    "eth_ip": "10.0.1.50",
    "eth_gw": "10.0.1.1",
    "eth_nm": "255.255.255.0",
    "tb_uri": "mqtts://152.42.209.180",
    "tb_port": 8883,
    "tb_qos": 1,
    "tb_root_ca": "-----BEGIN CERTIFICATE-----\\n...\\n-----END CERTIFICATE-----",
    "tb_device_cert": "-----BEGIN CERTIFICATE-----\\n...\\n-----END CERTIFICATE-----",
    "tb_device_key": "-----BEGIN PRIVATE KEY-----\\n...\\n-----END PRIVATE KEY-----",
    "rtu": {
        "baudrate": 9600,
        "data_bit": 8,
        "stop_bit": 1,
        "parity": 1,
        "response_timeout": 1000
    },
    "tcp": {
        "port": 502,
        "ipType": 0,
        "response_timeout": 1000
    },
    "devices": [
        {
            "sn": 1,
            "name": "Energy_Meter_Main",
            "mode": 0,
            "id": 1,
            "ip": "192.168.1.201",
            "port": 502
        }
    ],
    "registers": [
        {
            "sn": 1,
            "key": "ActivePower",
            "unit": "kW",
            "start": 0,
            "scale": 100,
            "mb": 1,
            "type": 4
        }
    ]
}
```

---

## Device Restart

Restart the IoT gateway device.

### Request

```http
GET /reboot
```

### Response Messages

| Status | Message                |
| ------ | ---------------------- |
| 200    | "Device is restarting" |

!!! warning "Important"
Connection will be lost during restart. Allow around 30 seconds for device to fully restart.
