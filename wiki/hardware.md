# Hardware Specification 

The Yeti Industrial IoT Gateway is built around the powerful **Espressif ESP32-S3** System-on-Chip (SoC). This choice provides a robust foundation with a dual-core processor, ample memory, and a rich set of peripherals.

<!-- ![hardware](./assets/images/outline/yeti.png) -->

<p align="center">
  <img src="./assets/images/outline/yeti.png" width="60%">
</p>

### Key Components

- **SoC**: Espressif ESP32-S3
    - **CPU**: Dual-core Xtensa® LX7 microprocessor
    - **Memory**: Internal SRAM and ROM
    - **Wireless**: Wi-Fi 802.11 b/g/n and Bluetooth 5 (LE)
- **Peripherals**:
    - **Ethernet**: Wired connectivity via an external PHY.
    - **Temperature Sensor**: On-board temperature monitoring.
    - **RS232/RS485**: For serial communication with industrial devices.
    - **CAN Bus**: Using the TWAI (Two-Wire Automotive Interface) controller for robust communication in noisy environments.
    - **GPIO, I2C, SPI**: For connecting a wide range of sensors, displays, and other components.
    - **Buzzer**: For audible user feedback.

### Connectivity

The gateway is designed for versatile connectivity:

- **Wired**:
    - Ethernet (10/100 Mbps)
    - RS232
    - RS485 (for Modbus RTU)
    - CAN Bus
- **Wireless**:
    - Wi-Fi (Access Point and Station modes)
    - Bluetooth Low Energy (BLE)

