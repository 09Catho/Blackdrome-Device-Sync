# Blackdrome Device Sync

A Windows application that allows you to **wirelessly control your Android smartphone** from your PC and **transfer files** at high speeds up to **1.2 Gbps**. With a simple and intuitive interface, just enter your phone's IP address, click connect, and you're ready to go!

> **Note:** Windows Defender may display a warning since the application is not digitally signed. Please see the [Troubleshooting](#troubleshooting) section for more details.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Download and Installation](#download-and-installation)
- [Usage](#usage)
- [Enabling Developer Mode and Wireless Debugging on Android](#enabling-developer-mode-and-wireless-debugging-on-android)
- [Troubleshooting](#troubleshooting)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Features

- **Wireless Control**: Control your Android smartphone from your Windows PC over Wi-Fi.
- **High-Speed File Transfer**: Transfer files between your PC and smartphone at speeds up to **1.2 Gbps**.
- **Easy Setup**: Simple interface requiring only your phone's IP address.
- **All-in-One Package**: Includes all necessary files (`scrcpy`, `adb`, etc.)—no need for separate installations.
- **Seamless Connection**: One-click connection to your Android device.
- **Open Source**: Available on GitHub for transparency and contributions.

## Prerequisites

- **Windows PC** running Windows 7 or higher.
- **Android Smartphone** with Android 11 or higher (for wireless debugging).
- **Both devices connected to the same Wi-Fi network**.
- **Wireless Debugging enabled on your Android device**.
- **USB Debugging** enabled (for initial setup if necessary).

## Download and Installation

1. **Download the Blackdrome Device Sync Package:**

   - Visit the [GitHub repository](https://github.com/09Catho/Blackdrome-Device-Sync) of **09Catho**.
   - Go to the [Releases](https://github.com/09Catho/Blackdrome-Device-Sync/releases) section.
   - Download the latest version of **Blackdrome-Device-Sync.zip**.

2. **Extract the Zip File:**

   - Right-click on the downloaded `Blackdrome-Device-Sync.zip` file.
   - Select **"Extract All..."** and choose a destination folder (e.g., `C:\BlackdromeDeviceSync`).

3. **Review the Extracted Contents:**

   - The extracted folder should contain:
     - **BlackdromeDeviceSync.exe**: The main application executable.
     - **scrcpy** folder: Contains `scrcpy.exe` and necessary files.
     - **adb.exe**: Android Debug Bridge executable.
     - **LICENSE**, **README.md**, and other documentation files.

## Usage

1. **Prepare Your Android Device:**

   - Ensure **Developer Options** and **Wireless Debugging** are enabled on your Android device.
   - Refer to [Enabling Developer Mode and Wireless Debugging on Android](#enabling-developer-mode-and-wireless-debugging-on-android) for detailed instructions.

2. **Connect Your Devices to the Same Wi-Fi Network:**

   - Both your Windows PC and Android smartphone must be connected to the same Wi-Fi network.

3. **Find Your Android Device's IP Address:**

   - On your Android device:
     - Go to **Settings > About phone > Status** (or **Settings > Network & internet > Wi-Fi > [Your Network]**).
     - Note down the **IP address**.

4. **Run the Application:**

   - Navigate to the extracted folder (e.g., `C:\BlackdromeDeviceSync`).
   - Double-click on **`BlackdromeDeviceSync.exe`** to launch the application.

   > **Note:** If Windows Defender SmartScreen appears, click **"More info"** and then **"Run anyway"**.

5. **Enter IP Address and Connect:**

   - In the application window:
     - Enter your Android device's **IP address** in the designated field.
     - Click the **"Connect"** button.

6. **Control Your Device and Transfer Files:**

   - The application will:
     - Connect to your device using ADB over Wi-Fi.
     - Launch `scrcpy` to mirror and control your device.
     - Enable high-speed file transfer capabilities.

7. **Disconnect When Finished:**

   - Click the **"Disconnect"** button in the application to safely disconnect your device.

## Enabling Developer Mode and Wireless Debugging on Android

### **Enable Developer Options:**

1. **Open Settings** on your Android device.
2. **Scroll down to** **"About phone"** or **"About device"**.
3. **Tap** **"Build number"** **seven times**.
   - You will see a message indicating that developer mode has been enabled.

### **Enable USB Debugging:**

1. **Go back to Settings**.
2. **Navigate to** **"System"** (may vary by device) and then **"Developer options"**.
3. **Scroll down** and **toggle on** **"USB debugging"**.
   - Confirm any prompts that appear.

### **Enable Wireless Debugging:**

1. **In Developer options**, find **"Wireless debugging"**.
2. **Toggle on** **"Wireless debugging"**.
   - Confirm any prompts or enter your device's password/PIN if required.

### **Connect to Trusted Network:**

- Ensure your Android device is connected to the same Wi-Fi network as your PC.
- Wireless debugging should only be used on trusted networks to prevent unauthorized access.

## Troubleshooting

### **Windows Defender Warning**

- **Issue**: When running the application, Windows Defender SmartScreen may display a warning since the application is not digitally signed.
- **Solution**:
  - Click **"More info"** on the SmartScreen dialog.
  - Click **"Run anyway"** to proceed.
  - Alternatively, right-click the executable, select **"Properties"**, and check **"Unblock"** if available.

> **Warning:** Only bypass SmartScreen warnings for software you trust.

### **Device Refused to Connect**

- **Ensure Wireless Debugging is Enabled**:
  - Verify that **Wireless debugging** is toggled on in **Developer options**.
- **Check IP Address**:
  - Confirm that the IP address entered in the application matches your device's current IP address.
- **Same Wi-Fi Network**:
  - Both devices must be connected to the same Wi-Fi network.
- **Restart Wireless Debugging**:
  - Toggle **Wireless debugging** off and back on.
- **Firewall Settings**:
  - Ensure that your PC's firewall is not blocking `adb.exe`.
  
### **Application Not Launching**

- **Run as Administrator**:
  - Right-click the executable and select **"Run as administrator"**.
- **Antivirus Software**:
  - Your antivirus might block the application. Add it to the exclusion list if necessary.
  
### **Execution Policy Errors**

- **Adjust Execution Policy**:
  - Open PowerShell as administrator and run:
    ```powershell
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
  - This allows the application to run necessary scripts.

### **Wireless Debugging Not Working**

- **Update Android OS**:
  - Wireless debugging requires Android 11 or higher.
- **USB Debugging**:
  - Connect your device via USB and enable USB debugging for initial pairing if necessary.
  
### **File Transfer Issues**

- **Check Connection Stability**:
  - Unstable Wi-Fi connections can affect file transfers.
- **Firewall Settings**:
  - Ensure that your firewall is not blocking file transfer protocols.

## Acknowledgments

- **[scrcpy](https://github.com/Genymobile/scrcpy)**: An open-source tool for controlling Android devices.
- **[ADB (Android Debug Bridge)](https://developer.android.com/studio/command-line/adb)**: A versatile command-line tool that lets you communicate with a device.
- **Community Contributors**: Thank you to everyone who has contributed to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Disclaimer:** Use this application responsibly and ensure you have permission to control and transfer files with any devices you connect to. Wireless debugging should only be used on secure and trusted networks to prevent unauthorized access.

**Note:** The application is not digitally signed, which may cause Windows Defender to display a warning. Rest assured, the application is safe to use. Always download software from trusted sources.

# How to Contribute

We welcome contributions! If you'd like to contribute to this project, please follow these steps:

1. **Fork the Repository**:

   - Click on the **"Fork"** button at the top right corner of the repository page.

2. **Clone Your Fork**:

   ```bash
   git clone https://github.com/yourusername/Blackdrome-Device-Sync.git
   ```

3. **Create a New Branch**:

   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Make Your Changes**:

   - Add new features, fix bugs, or improve documentation.

5. **Commit Your Changes**:

   ```bash
   git commit -am "Add your commit message here"
   ```

6. **Push to Your Fork**:

   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a Pull Request**:

   - Go to your fork on GitHub.
   - Click on **"Compare & pull request"**.
   - Describe your changes and submit the pull request.

# Contact

If you have any questions or need assistance, feel free to open an issue on the GitHub repository or contact the maintainer:

- **GitHub**: [09Catho](https://github.com/09Catho)
## Acknowledgments

- **[scrcpy](https://github.com/Genymobile/scrcpy)**: Included under the Apache License 2.0. See `scrcpy/LICENSE` for details.

---

Thank you for using **Blackdrome Device Sync**! I hope this tool enhances your productivity and provides a seamless experience in controlling your Android device from your Windows PC.
