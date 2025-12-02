# Overview

The Yeti Industrial IoT Gateway is a robust, enterprise-ready device that bridges the gap between industrial equipment and modern cloud-based IoT platforms. Built for industrial environments, it provides secure, reliable connectivity with comprehensive monitoring and configuration capabilities.

### Key Features

- **Advanced Protocol Support**:
    - **Modbus**: Acts as a Modbus master for both RTU (via RS485) and TCP protocols.
    - **RS232**: Dedicated serial communication interface.
    - **TWAI (CAN)**: Two-Wire Automotive Interface for CAN bus connectivity.

- **Dual-Mode Configuration**:
    - **Web Interface**: An intuitive, browser-based UI for complete device configuration and management.
    - **Bluetooth LE**: Allows for quick, on-site configuration of network and device settings directly from a mobile device.

- **Flexible Networking**:
    - **WiFi & Ethernet**: Supports both WiFi (AP/STA) and wired Ethernet (W5500) for reliable network access.
    - **mDNS Discovery**: Easily discover the gateway on a local network using a configurable hostname.
    - **Captive Portal**: Simplifies initial WiFi setup by redirecting new devices to the configuration page.

- **Robust Cloud Integration**:
    - **Secure MQTT**: Connects to cloud platforms like ThingsBoard using secure, certificate-based MQTT.
    - **Over-the-Air (OTA) Updates**: Reliably update device firmware remotely.
    - **Remote Logging**: Caches and forwards system logs to the cloud, ensuring no data is lost during network outages.

### Quick Start Guide

Get your Yeti gateway up and running in minutes:

1. **Power On** - Connect 12V DC jack power supply
2. **Connect** - Access device WiFi access point or connect via Ethernet
3. **Login** - Use credentials through captive portal interface
4. **Configure Network** - Set up WiFi/Ethernet connectivity
5. **Add Devices** - Configure your Modbus devices and register mappings
6. **Setup Modbus** - Configure connection parameters (RTU/TCP)
7. **Cloud Integration** - Set up ThingsBoard MQTT connection
8. **Apply & Reboot** - Save settings and restart to activate configuration
