# Bluetooth Low Energy (BLE) Configuration

The Yeti Gateway supports configuration over Bluetooth Low Energy (BLE), providing a convenient way to set up the device without requiring initial network connectivity.

## Overview

The gateway hosts a BLE GATT (Generic Attribute Profile) server that exposes services and characteristics for reading and writing configuration parameters. This allows a mobile application or other BLE central device to connect and provision the gateway.

## GATT Services

The BLE service is organized into two main profiles: **Settings** and **Sensor**.

### Settings Profile

This profile is used to configure the various communication and network interfaces of the gateway.

- **Service UUID**: `0x00FF`

#### Characteristics

| Characteristic Name    | UUID     | Properties | Description                                   |
| ---------------------- | -------- | ---------- | --------------------------------------------- |
| WiFi Settings          | `0xFF01` | Write      | Configure WiFi SSID, password, and static IP. |
| Ethernet Settings      | `0xFF02` | Write      | Configure Ethernet static IP settings.        |
| MQTT Settings          | `0xFF03` | Write      | Set up the MQTT broker connection parameters. |
| Modbus RTU Settings    | `0xFF04` | Write      | Configure Modbus RTU serial parameters.       |
| Modbus TCP Settings    | `0xFF05` | Write      | Configure Modbus TCP connection parameters.   |
| Modbus Device/Register | `0xFF06` | Write      | Configure Modbus slave devices and registers. |

### Sensor Profile

This profile is used for monitoring internal device status.

- **Service UUID**: `0xFF07`

#### Characteristics

| Characteristic Name | UUID     | Properties     | Description                            |
| ------------------- | -------- | -------------- | -------------------------------------- |
| Test Sensor         | `0xFF08` | Read, Indicate | A test characteristic for sensor data. |

## Data Transfer Protocol

Due to the limited size of BLE packets (MTU), a chunking protocol is used to transfer larger JSON configuration payloads.

### Packet Structure

Each write operation to a characteristic consists of a packet with the following header:

| Index | Size (bytes) | Description     |
| ----- | ------------ | --------------- |
| 0-1   | 2            | Handle ID       |
| 2     | 1            | Total Chunks    |
| 3     | 1            | Current Chunk # |
| 4-5   | 2            | Data Length     |
| 6+    | n            | Payload Data    |

### Workflow

1.  **Connect**: A BLE central device connects to the Yeti Gateway.
2.  **Discover**: The central discovers the services and characteristics.
3.  **Prepare Data**: The central prepares a JSON payload for the desired configuration (e.g., WiFi settings).
4.  **Chunk & Send**: The central splits the JSON payload into multiple chunks, adds the header to each chunk, and writes them sequentially to the appropriate characteristic.
5.  **Reassembly**: The gateway receives the chunks, validates their order, and reassembles the complete JSON payload.
6.  **Process**: Once all chunks are received, the gateway parses the JSON and applies the new settings.
7.  **Feedback**: The onboard buzzer provides audible feedback (`BUZZER_SOUND_SUCCESS` or `BUZZER_SOUND_ERROR`) to indicate the result of the operation.
