# Other Communication Settings

## RS232 Communication Parameters

Configure RS232 serial communication settings.

### Request

```http
POST /settings?rs232=1
Content-Type: application/json
```

### Request Body

```json
{
    "rs232": {
        "baudrate": 115200,
        "parity": 0,
        "stop_bit": 1,
        "data_bit": 8,
        "response_timeout": 1000
    }
}
```

**Request Body Fields:**

| Field | Type   | Description                              |
| ----- | ------ | ---------------------------------------- |
| rs232 | object | RS232 communication parameters container |

**RS232 Object Fields:**

| Field            | Type    | Description                                  |
| ---------------- | ------- | -------------------------------------------- |
| baudrate         | integer | Communication speed in bits per second       |
| parity           | integer | Parity checking mode (0:None, 1:Even, 2:Odd) |
| stop_bit         | integer | Number of stop bits (1 or 2)                 |
| data_bit         | integer | Number of data bits per frame (5-8)          |
| response_timeout | integer | Response timeout in milliseconds             |

### Response Messages

| Status | Message                            |
| ------ | ---------------------------------- |
| 200    | "Settings Saved"                   |
| 400    | "Invalid communication parameters" |
| 500    | "Failed to save RS232 settings"    |

---

## TWAI (CAN) Communication Parameters

Configure TWAI (CAN bus) network communication settings.

### Request

```http
POST /settings?twai=1
Content-Type: application/json
```

### Request Body

```json
{
    "twai": {
        "bitrate": 250000
    }
}
```

**Request Body Fields:**

| Field | Type   | Description                             |
| ----- | ------ | --------------------------------------- |
| twai  | object | TWAI communication parameters container |

**TWAI Object Fields:**

| Field   | Type    | Description                                                                                       |
| ------- | ------- | ------------------------------------------------------------------------------------------------- |
| bitrate | integer | Bit rate in bits per second (e.g., 25000, 50000, 100000, 125000, 250000, 500000, 800000, 1000000) |

### Response Messages

| Status | Message                            |
| ------ | ---------------------------------- |
| 200    | "Settings Saved"                   |
| 400    | "Invalid communication parameters" |
| 500    | "Failed to save TWAI settings"     |
