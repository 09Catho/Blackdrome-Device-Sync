<#
  Copyright 2024 09Catho

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
#>

# Check and Set Execution Policy
$currentPolicy = Get-ExecutionPolicy
if ($currentPolicy -eq 'Restricted' -or $currentPolicy -eq 'AllSigned') {
    Write-Host "Current execution policy is $currentPolicy. Adjusting execution policy for this session..."
    Start-Process powershell "-ExecutionPolicy RemoteSigned -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Load necessary assemblies for WPF
Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

# Define XAML for the WPF window with increased opacity
$XAML = @"
<Window xmlns='http://schemas.microsoft.com/winfx/2006/xaml/presentation'
        xmlns:x='http://schemas.microsoft.com/winfx/2006/xaml'
        Title='BLACKDROME DEVICE SYNC' Height='300' Width='400' ResizeMode='NoResize' Background='#FF1E1E1E'>
    <Window.Effect>
        <DropShadowEffect BlurRadius='20' ShadowDepth='0' Color='#FF000000'/>
    </Window.Effect>
    <Grid Margin='10'>
        <Grid.RowDefinitions>
            <RowDefinition Height='Auto'/>
            <RowDefinition Height='Auto'/>
            <RowDefinition Height='*'/>
            <RowDefinition Height='Auto'/>
        </Grid.RowDefinitions>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width='Auto'/>
            <ColumnDefinition Width='*'/>
            <ColumnDefinition Width='Auto'/>
        </Grid.ColumnDefinitions>

        <!-- IP Address Label -->
        <Label Grid.Row='0' Grid.Column='0' Content='IP Address:' Foreground='White' VerticalAlignment='Center' Margin='0,0,5,5'/>

        <!-- IP Address TextBox -->
        <TextBox x:Name='IpAddressTextBox' Grid.Row='0' Grid.Column='1' Background='#FF2D2D30' Foreground='White' BorderBrush='#FF3E3E42' BorderThickness='1' Margin='0,0,0,5'/>

        <!-- scrcpy Path Label -->
        <Label Grid.Row='1' Grid.Column='0' Content='scrcpy.exe:' Foreground='White' VerticalAlignment='Center' Margin='0,0,5,5'/>

        <!-- scrcpy Path Display -->
        <TextBlock x:Name='ScrcpyPathLabel' Grid.Row='1' Grid.Column='1' Foreground='White' Text='No file selected' Margin='0,0,0,5'/>

        <!-- Browse Button -->
        <Button x:Name='BrowseButton' Grid.Row='1' Grid.Column='2' Content='Browse' Width='75' Height='25' Margin='5,0,0,5' Background='#FF2D2D30' Foreground='White' BorderBrush='#FF3E3E42' BorderThickness='1' Cursor='Hand'/>

        <!-- Connect and Disconnect Buttons -->
        <StackPanel Grid.Row='3' Grid.Column='0' Grid.ColumnSpan='3' Orientation='Horizontal' HorizontalAlignment='Center' Margin='0,10,0,0'>
            <Button x:Name='ConnectButton' Content='Connect' Width='120' Height='40' Margin='10' FontSize='14' Foreground='White' Background='#FF2D2D30' BorderBrush='#FF3E3E42' BorderThickness='1' Cursor='Hand'>
                <Button.Effect>
                    <DropShadowEffect Color='#FF00FFFF' BlurRadius='10' ShadowDepth='0'/>
                </Button.Effect>
            </Button>
            <Button x:Name='DisconnectButton' Content='Disconnect' Width='120' Height='40' Margin='10' FontSize='14' Foreground='White' Background='#FF2D2D30' BorderBrush='#FF3E3E42' BorderThickness='1' Cursor='Hand'>
                <Button.Effect>
                    <DropShadowEffect Color='#FFFF00FF' BlurRadius='10' ShadowDepth='0'/>
                </Button.Effect>
            </Button>
        </StackPanel>
    </Grid>
</Window>
"@

# Load the XAML
[System.Reflection.Assembly]::LoadWithPartialName('PresentationFramework') | Out-Null
$reader = New-Object System.IO.StringReader($XAML)
$xmlReader = [System.Xml.XmlReader]::Create($reader)
$Window = [Windows.Markup.XamlReader]::Load($xmlReader)

# Find the controls by their x:Name
$IpAddressTextBox = $Window.FindName('IpAddressTextBox')
$ScrcpyPathLabel = $Window.FindName('ScrcpyPathLabel')
$BrowseButton = $Window.FindName('BrowseButton')
$ConnectButton = $Window.FindName('ConnectButton')
$DisconnectButton = $Window.FindName('DisconnectButton')

# Variables to store user inputs
$global:ScrcpyPath = ''
$global:IpAddress = ''
$global:adbPath = ''

# Browse Button Click Event
$BrowseButton.Add_Click({
    [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $fileDialog.Filter = 'scrcpy.exe|scrcpy.exe'
    $fileDialog.Title = 'Select scrcpy.exe'
    if ($fileDialog.ShowDialog() -eq 'OK') {
        $global:ScrcpyPath = $fileDialog.FileName
        $ScrcpyPathLabel.Text = $global:ScrcpyPath
        # Update adbPath
        $global:adbPath = Join-Path (Split-Path $global:ScrcpyPath) 'adb.exe'
    }
})

# Connect Button Click Event
$ConnectButton.Add_Click({
    # Get the IP address from the text box
    $global:IpAddress = $IpAddressTextBox.Text

    if ([string]::IsNullOrWhiteSpace($global:IpAddress)) {
        [System.Windows.MessageBox]::Show('Please enter the IP address.', 'Error', 'OK', 'Error')
        return
    }

    if (-not (Test-Path $global:ScrcpyPath)) {
        [System.Windows.MessageBox]::Show('Please select a valid scrcpy.exe path.', 'Error', 'OK', 'Error')
        return
    }

    if (-not (Test-Path $global:adbPath)) {
        [System.Windows.MessageBox]::Show("adb.exe not found in the same directory as scrcpy.exe.", 'Error', 'OK', 'Error')
        return
    }

    # Change directory to the location of scrcpy.exe
    Push-Location (Split-Path $global:ScrcpyPath)

    # Execute adb connect
    $adbConnectResult = & $global:adbPath connect $global:IpAddress

    if ($adbConnectResult -match 'connected to') {
        # Start scrcpy.exe
        Start-Process -FilePath $global:ScrcpyPath

        [System.Windows.MessageBox]::Show("Connected to $global:IpAddress and launched scrcpy.", 'Success', 'OK', 'Information')
    } else {
        [System.Windows.MessageBox]::Show("Failed to connect to $global:IpAddress.`n$adbConnectResult", 'Error', 'OK', 'Error')
    }

    Pop-Location
})

# Disconnect Button Click Event
$DisconnectButton.Add_Click({
    if (-not (Test-Path $global:adbPath)) {
        [System.Windows.MessageBox]::Show("adb.exe not found.", 'Error', 'OK', 'Error')
        return
    }

    # Execute adb disconnect
    $adbDisconnectResult = & $global:adbPath disconnect

    [System.Windows.MessageBox]::Show("Disconnected device(s).`n$adbDisconnectResult", 'Info', 'OK', 'Information')
})

# Show the window
$Window.ShowDialog()
