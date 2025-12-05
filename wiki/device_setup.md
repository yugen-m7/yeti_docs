This document outlines the step-by-step process for setting up and configuring the Yeti Gateway, including network connection, Modbus configuration, and cloud integration.

### Prerequisites

- A Yeti Gateway device
- The device's MAC address (specifically the last 4 digits)
- Local WiFi network credentials (SSID and Password)
- Cloud server credentials and certificate files (Provided with the device)

### Part 1: Initial Connection & Network Setup
[]()

1. Connect to the Access Point
      1. Power on the Yeti Gateway.
      2. On your computer or mobile device, open your WiFi settings.
      3. Connect to the network named YETI-PRO-_XXXX_.
          - replace _XXXX_ with the last 4 digits of device's MAC address
      4. Captive Portal:
          - Ideally, a login page will open automatically.
          - If it does not, Go to your prefered web browser and go to `http://192.168.192.168`.

2. Initial Login
      - Log in to the local configuration page using the following credentials:

      ```
        Username: yeti-pro-admin
        Password: The last 4 digits of the device's MAC address.
      ```

3. Configure WiFi
      1. Once logged in, navigate to the WiFi Settings page.
      2. Enter your local network's SSID and Password.
      3. IP Configuration:
          - Dynamic IP: Ensure the Use DHCP box is checked.
          - Static IP: Uncheck Use DHCP and manually enter the IP Address, Gateway, and Netmask.
      4. Click Save WiFi Settings.
      5. Click Restart to apply the changes.

### Part 2: Accessing the Web Interface

1. After the device restarts, it will be connected to your local network. You can now access it using its hostname rather than the direct access point.
2. Connect your computer/phone to the same local network as the Yeti Gateway.
3. Open a web browser and navigate to `http://yeti-pro-XXXX.local`:
    - replace _XXXX_ with the last 4 digits of device's MAC address
4. Log in again using the same credentials:
      ```
        Username: yeti-pro-admin
        Password: The last 4 digits of the device's MAC address.
      ```

### Part 3: Modbus Configuration

1. Configure Connection Settings 
      1. Navigate to the Connection tab.
      2. Configure the RTU/TCP Settings.
          - Note: These settings must match the settings of your connected Modbus devices.
      3. Click Save RTU/TCP Settings.

2. Add Modbus Devices
      1. Navigate to the Modbus tab.
      2. Click on a device block (e.g., Device 1) to open its settings.
      3. Enter the Slave ID for the specific hardware you are connecting.
      4. Click Add Register to configure data points.
      5. Enter the register details:
          - Parameter Name
          - Unit
          - Register Address
          - Register count 
          - Data Type
          - Scale
      6. Click Add Register to save the specific data point.
      7. Repeat for all necessary registers.
      8. Click Back to Slave List.
      9. Finally, click Save Modbus Settings on the main Modbus page.

### Part 4: Cloud Configuration

1. Configure Server Settings
      1. Navigate to the Cloud tab.
      2. Enter the Server URL (e.g., mqtts://tb.example.com).
      3. Enter the Port (e.g., 8883).
      4. Select the QoS Level.

2. Upload Certificates
      1. You will need to copy and paste the content of your certificate files into the respective fields:
          - Root CA Certificate (PEM)
          - Device Certificate (PEM)
          - Device Private Key (PEM)

3. Save and Restart
      1. Click Save Cloud Settings.
      2. Click Restart in the top menu to apply the new cloud configuration.

### Part 5: Data Visualization

1. To Visualize the device is sending data:
      1. Open a browser and navigate to the application server: `https://www.garud.cloud`
      2. Log in with your user credentials.
      3. On the dashboard, locate your device in the Your Devices list.
      4. Click the device name to view the Live Telemetry Data.
