# Modbus Communication Settings

## RTU Communication Parameters

Configure Modbus RTU serial communication settings.

### Request

```http
POST /settings?mb_rtu=1
Content-Type: application/json
```

### Request Body

```json
{
    "rtu": {
        "baudrate": 9600,
        "parity": 1,
        "stop_bit": 1,
        "data_bit": 8,
        "response_timeout": 1000
    }
}
```

**Request Body Fields:**

| Field      | Type   | Description                            |
| ---------- | ------ | -------------------------------------- |
| connection | object | RTU communication parameters container |

**Connection Object Fields:**

| Field                | Type    | Description                            |
| -------------------- | ------- | -------------------------------------- |
| baudrate             | integer | Communication speed in bits per second |
| parity               | integer | Parity checking mode                   |
| stop_bit             | integer | Number of stop bits                    |
| data_bit             | integer | Number of data bits per frame          |
| rtu_response_timeout | integer | Response timeout in milliseconds       |

### Response Messages

| Status | Message                            |
| ------ | ---------------------------------- |
| 200    | "RTU settings saved successfully!" |
| 400    | "Invalid communication parameters" |
| 500    | "Failed to save RTU settings"      |

---

## TCP Communication Parameters

Configure Modbus TCP network communication settings.

### Request

```http
POST /settings?mb_tcp=1
Content-Type: application/json
```

### Request Body

```json
{
    "tcp": {
        "port": 502,
        "ipType": 0,
        "response_timeout": 1000
    }
}
```

**Request Body Fields:**

| Field      | Type   | Description                            |
| ---------- | ------ | -------------------------------------- |
| connection | object | TCP communication parameters container |

**Connection Object Fields:**

| Field                | Type    | Description                              |
| -------------------- | ------- | ---------------------------------------- |
| port                 | integer | TCP port number for Modbus communication |
| ipType               | integer | IP version type(0=IPv4, 1=IPv6)          |
| tcp_response_timeout | integer | Response timeout in milliseconds         |

### Response Messages

| Status | Message                            |
| ------ | ---------------------------------- |
| 200    | "TCP settings saved successfully!" |
| 400    | "Invalid communication parameters" |
| 500    | "Failed to save TCP settings"      |
