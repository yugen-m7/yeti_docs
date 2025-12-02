# ThingsBoard MQTT Data Publishing

## Modbus Data Publishing

### Device Attributes

Modbus register information is published to:

- **Topic**: `v1/devices/me/attributes`
- **Purpose**: Sends register configuration metadata
- **Data Format**:

```json
{
    "mb_attr": [
        {
            "sid": 1,
            "name": "Device 00",
            "data": [
                {
                    "cid": 0,
                    "name": "voltage",
                    "unit": "volt"
                },
                {
                    "cid": 1,
                    "name": "light",
                    "unit": ""
                }
            ]
        },
        {
            "sid": 2,
            "name": "Device 01",
            "data": [
                {
                    "cid": 2,
                    "name": "current",
                    "unit": "amp"
                }
            ]
        }
    ]
}
```

**Request Body Fields:**

| Field   | Type  | Description                             |
| ------- | ----- | --------------------------------------- |
| mb_attr | array | Array of slave device attribute objects |

**Slave Attribute Object Fields:**

| Field | Type    | Description                                        |
| ----- | ------- | -------------------------------------------------- |
| sid   | integer | Slave ID - identifies the Modbus slave device      |
| name  | string  | Human-readable name for the slave device           |
| data  | array   | Array of register attribute objects for this slave |

**Register Attribute Object Fields (within `data` array):**

| Field | Type    | Description                                           |
| ----- | ------- | ----------------------------------------------------- |
| cid   | integer | Channel ID - identifies the specific register/channel |
| name  | string  | Human-readable name for the register                  |
| unit  | string  | Unit of measurement for the value                     |

### Device Telemetry

Real-time Modbus data readings are published to:

- **Topic**: `v1/devices/me/telemetry`
- **Purpose**: Sends live sensor data values
- **Data Format**:

```json
{
    "sid": 1,
    "data": [
        {
            "cid": 0,
            "value": 212.03158569335938
        },
        {
            "cid": 1,
            "value": 1
        }
    ]
}
```

**Request Body Fields:**

| Field | Type    | Description                                   |
| ----- | ------- | --------------------------------------------- |
| sid   | integer | Slave ID - identifies the Modbus slave device |
| data  | array   | Array of telemetry data objects               |

**Data Object Fields:**

| Field | Type    | Description                                           |
| ----- | ------- | ----------------------------------------------------- |
| cid   | integer | Channel ID - identifies the specific register/channel |
| value | number  | Current reading value from the Modbus register        |

## RPC Data Publishing

### RPC Attributes

Device system information published via RPC to attributes:

- **Topic**: `v1/devices/me/attributes` (via RPC)
- **Purpose**: Sends device configuration and system information
- **Data Format**:

```json
{
    "idf_target": "esp32s3"
}
```

**Fields:**

| Field      | Type   | Description                        |
| ---------- | ------ | ---------------------------------- |
| idf_target | string | ESP-IDF target platform identifier |

### RPC Telemetry

Device system metrics published via RPC to telemetry:

- **Topic**: `v1/devices/me/telemetry` (via RPC)
- **Purpose**: Sends real-time system performance data
- **Data Format**:

```json
{
    "dev_temp": 37.700000762939453,
    "free_heap": 130060,
    "up_time": 14
}
```

**Fields:**

| Field     | Type    | Description                    |
| --------- | ------- | ------------------------------ |
| dev_temp  | number  | Device temperature in Celsius  |
| free_heap | integer | Available heap memory in bytes |
| up_time   | integer | Device uptime in seconds       |

## References

### MQTT Quality of Service Levels

| QoS | Description            |
| --- | ---------------------- |
| 0   | At most once delivery  |
| 1   | At least once delivery |
| 2   | Exactly once delivery  |
