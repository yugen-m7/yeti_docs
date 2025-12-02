# Modbus Device Management

## Configure Devices and Registers

Configure up to 16 Modbus devices with their data registers.

### Request

```http
POST /settings?modbus=1
Content-Type: application/json
```

### Request Body

```json
{
    "devices": [
        {
            "sn": 1,
            "name": "Energy_Meter_Main",
            "mode": 1,
            "id": 1,
            "ip": "192.168.1.201",
            "port": 502
        },
        {
            "sn": 2,
            "name": "VFD_Motor_01",
            "mode": 0,
            "id": 2
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
        },
        {
            "sn": 2,
            "key": "MotorSpeed",
            "unit": "RPM",
            "start": 8192,
            "scale": 1,
            "mb": 1,
            "type": 2
        }
    ]
}
```

**Request Body Fields:**

| Field     | Type  | Description                             |
| --------- | ----- | --------------------------------------- |
| devices   | array | Array of device configuration objects   |
| registers | array | Array of register configuration objects |

**Device Object Fields:**

| Field | Type    | Description                          |
| ----- | ------- | ------------------------------------ |
| sn    | integer | Serial number/device slot identifier |
| name  | string  | Device identifier name               |
| mode  | integer | Connection type (0=RTU, 1=TCP)       |
| id    | integer | Modbus slave address                 |
| ip    | string  | IP address (TCP mode only)           |
| port  | integer | TCP port (TCP mode only)             |

**Register Object Fields:**

| Field | Type    | Description                                 |
| ----- | ------- | ------------------------------------------- |
| sn    | integer | Device serial number (must match device sn) |
| key   | string  | Parameter name identifier                   |
| unit  | string  | Engineering units                           |
| start | integer | Starting register address                   |
| scale | number  | Scale factor for value conversion           |
| mb    | integer | Modbus register type (see References)       |
| type  | integer | Parameter data type (see References)        |

!!! important
The API uses mode field (0/1) while the web interface displays this as type (RTU/TCP).

### References

#### Modbus Register Types

| Value | Type              | Description          | Access     |
| ----- | ----------------- | -------------------- | ---------- |
| 1     | Holding Registers | Read/Write registers | Read/Write |
| 2     | Input Registers   | Read-only input data | Read-only  |
| 3     | Coils             | Digital output bits  | Read/Write |
| 4     | Discrete Inputs   | Digital input bits   | Read-only  |

#### Parameter Data Types

| Value | Type                                         | Description               |
| ----- | -------------------------------------------- | ------------------------- |
| 1     | Unsigned Integer 8 Bit                       | 0-255                     |
| 2     | Unsigned Integer 16 Bit                      | 0-65535                   |
| 3     | Unsigned Integer 32 Bit                      | 0-4294967295              |
| 4     | Float                                        | IEEE 754 32-bit float     |
| 5     | ASCII                                        | Text string               |
| 6     | BIN                                          | Binary data               |
| 7     | Signed Integer 8 Bit (High Byte)             | -128 to 127               |
| 8     | Signed Integer 8 Bit (Low Byte)              | -128 to 127               |
| 9     | Unsigned Integer 8 Bit (High Byte)           | 0-255                     |
| 10    | Unsigned Integer 8 Bit (Low Byte)            | 0-255                     |
| 11    | Signed Integer 16 Bit Big Endian             | -32768 to 32767           |
| 12    | Signed Integer 16 Bit Little Endian          | -32768 to 32767           |
| 13    | Unsigned Integer 16 Bit Big Endian           | 0-65535                   |
| 14    | Unsigned Integer 16 Bit Little Endian        | 0-65535                   |
| 15    | Signed Integer 32 Bit Big Endian (ABCD)      | -2147483648 to 2147483647 |
| 16    | Signed Integer 32 Bit Big Endian (CDAB)      | -2147483648 to 2147483647 |
| 17    | Signed Integer 32 Bit Little Endian (BADC)   | -2147483648 to 2147483647 |
| 18    | Signed Integer 32 Bit Little Endian (DCBA)   | -2147483648 to 2147483647 |
| 19    | Unsigned Integer 32 Bit Big Endian (ABCD)    | 0-4294967295              |
| 20    | Unsigned Integer 32 Bit Big Endian (CDAB)    | 0-4294967295              |
| 21    | Unsigned Integer 32 Bit Little Endian (BADC) | 0-4294967295              |
| 22    | Unsigned Integer 32 Bit Little Endian (DCBA) | 0-4294967295              |
| 23    | Float Big Endian (ABCD)                      | IEEE 754 32-bit float     |
| 24    | Float Big Endian (CDAB)                      | IEEE 754 32-bit float     |
| 25    | Float Little Endian (BADC)                   | IEEE 754 32-bit float     |
| 26    | Float Little Endian (DCBA)                   | IEEE 754 32-bit float     |

### Response Messages

| Status | Message                               |
| ------ | ------------------------------------- |
| 200    | "Modbus settings saved successfully!" |
| 400    | "Invalid device configuration"        |
| 409    | "Duplicate slave ID detected"         |
