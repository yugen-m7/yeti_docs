<!-- ### Yeti Gateway Setup Guide -->

This document outlines the step-by-step process for setting up and configuring the Yeti Gateway, including network connection, Modbus configuration, and cloud integration.

### Prerequisites

- A Yeti Gateway device
- The device's MAC address (specifically the last 4 digits)
- WiFi network credentials (SSID and Password)
- Cloud server credentials and certificate files

### Part 1: Initial Connection & Network Setup

1. Connect to the Access Point
      - Power on the Yeti Gateway.
      - On your computer or mobile device, open your WiFi settings.
      - Connect to the network named YETI-PRO-ACC.
      - Captive Portal:
           - Ideally, a login page will open automatically.
           - If it does not, open your WiFi settings for the connected network and select Manage Router (or open a browser and navigate to the gateway IP, typically 192.168.0.1).

2. Initial Login
      - Log in to the local configuration page using the following credentials:  
        Username: yeti-pro-admin  
        Password: The last 4 digits of the device's MAC address.

3. Configure WiFi
      - Once logged in, navigate to the WiFi Settings page.
      - Enter your local network's SSID and Password.
      - IP Configuration:
           - Dynamic IP: Ensure the Use DHCP box is checked.
           - Static IP: Uncheck Use DHCP and manually enter the IP Address, Gateway, and Netmask.
      - Click Save WiFi Settings.
      - Click Restart to apply the changes.

### Part 2: Accessing the Web Interface

- After the device restarts, it will be connected to your local network. You can now access it using its hostname rather than the direct access point.
- Connect your computer/phone to the same local network as the Yeti Gateway.
- Open a web browser and navigate to:
     - http://yeti-pro-{XXXX}.local
     - (Replace {XXXX} with the last 4 digits of the device's MAC address)
- Log in again using the same credentials:
     - Username: yeti-pro-admin
     - Password: Last 4 digits of MAC address.

### Part 3: Modbus Configuration

1. Configure Connection Settings
      - Navigate to the Connection tab.
      - Configure the RTU Settings (Baudrate, Parity, Stop Bit, Data Bit).
      - Note: These settings must match the settings of your connected Modbus devices.
      - Click Save RTU Settings.

2. Add Modbus Devices
      - Navigate to the Modbus tab.
      - Click on a device block (e.g., Device 1) to open its settings.
      - Enter the Slave ID for the specific hardware you are connecting.
      - Click Add Register to configure data points.
      - Enter the register details:
           - Parameter Name
           - Unit
           - Register Address
           - Data Type / Count
      - Click Add Register to save the specific data point.
      - Repeat for all necessary registers.
      - Click Back to Slave List.
      - Finally, click Save Modbus Settings on the main Modbus page.

### Part 4: Cloud Configuration

1. Configure Server Settings
      - Navigate to the Cloud tab.
      - Enter the Server URL (e.g., mqtts://tb.example.com).
      - Enter the Port (e.g., 8883).
      - Select the QoS Level.

2. Upload Certificates  
   You will need to copy and paste the content of your certificate files into the respective fields:
      - Root CA Certificate (PEM)
      - Device Certificate (PEM)
      - Device Private Key (PEM)

3. Save and Restart
      - Click Save Cloud Settings.
      - Click Restart in the top menu to apply the new cloud configuration.

### Part 5: Verification

1. To confirm the device is sending data:
     - Open a browser and navigate to the application server: `https://garud.cloud`
     - Log in with your user credentials.
     - On the dashboard, locate your device in the Your Devices list.
     - Click the device name to view the Live Telemetry Data.
     - Data should update automatically (typically every 5 seconds).
     - Setup Complete.
