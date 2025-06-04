# Blackdrome Device Sync

A Windows application that allows you to **wirelessly control your Android smartphone** from your PC and **transfer files** at high speeds up to **1.2 Gbps**. With a simple and intuitive interface, just enter your phone's IP address, click connect, and you're ready to go!

## Download

<p align="center">
  <a href="https://github.com/09Catho/Blackdrome-Device-Sync/archive/refs/tags/v1.0.0.zip">
    <img src="https://img.shields.io/badge/Download-Blackdrome--Device--Sync.zip-blue?style=for-the-badge&logo=github" alt="Download Blackdrome-Device-Sync.zip">
  </a>
</p>

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
- [How to Contribute](#how-to-contribute)
- [Contact](#contact)
- [Creator](#creator)

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
   - Visit the [GitHub repository](https://github.com/09Catho/Blackdrome-Device-Sync).
   - Go to the [Releases](https://github.com/09Catho/Blackdrome-Device-Sync/releases) section.
   - Download the latest version of **Blackdrome-Device-Sync.zip**.

2. **Download and Install ADB:**
   - **Important:** `adb.exe` is not included due to licensing restrictions.
   - Download the **Android SDK Platform Tools** from the [official Android website](https://developer.android.com/studio/releases/platform-tools).
   - Extract the contents to a folder (e.g., `C:\PlatformTools`).

3. **Prepare the Application:**
   - Copy `adb.exe` from the `platform-tools` folder to the `scrcpy` folder inside `BlackdromeDeviceSync`.

4. **Extract the Blackdrome Device Sync Zip File:**
   - Right-click on the downloaded `Blackdrome-Device-Sync.zip` file.
   - Select **"Extract All..."** and choose a destination folder (e.g., `C:\BlackdromeDeviceSync`).

5. **Run the Application:**
   - Navigate to the extracted folder.
   - Double-click on **`BlackdromeDeviceSync.exe`** to launch the application.
   - If Windows Defender warns you, click **"More info"** → **"Run anyway"**.

## Usage

### Using the Executable

1. **Run the Application**:
   - Navigate to the folder (e.g., `C:\BlackdromeDeviceSync`).
   - Launch **`BlackdromeDeviceSync.exe`**.

2. **Enter IP Address and Connect**:
   - Enter your Android device's IP address.
   - Click **"Connect"** to mirror and control your device and transfer files.

3. **Disconnect When Finished**:
   - Click the **"Disconnect"** button to safely disconnect.

### Using the PowerShell Script

1. **Create a Desktop Shortcut**:
   - Right-click desktop → New → Shortcut.
   - Use this as the location:
     ```
     C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "C:\Users\your_user\Desktop\Blackdrome_Device_Sync.ps1"
     ```

2. **Run the Shortcut**:
   - Double-click the shortcut to launch.

## Enabling Developer Mode and Wireless Debugging on Android

### Enable Developer Options:

1. Go to **Settings** → **About phone**.
2. Tap **Build number** seven times.

### Enable USB Debugging:

1. Go to **Settings** → **System** → **Developer options**.
2. Enable **USB debugging**.

### Enable Wireless Debugging:

1. Enable **Wireless debugging** in Developer options.
2. Ensure your phone is on the same Wi-Fi network as your PC.

## Troubleshooting

### Windows Defender Warning

- Click **"More info"** → **"Run anyway"**.
- Right-click EXE → **Properties** → **Unblock** (if available).

### Device Refused to Connect

- Verify **Wireless debugging** is enabled.
- Ensure both devices are on the same Wi-Fi network.
- Check your IP address is correct.
- Restart wireless debugging.
- Adjust your firewall to allow `adb.exe`.

### Application Not Launching

- Try **Run as Administrator**.
- Add to antivirus exclusions.

### Execution Policy Errors

- In PowerShell (Admin), run:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
