![alt text](https://github.com/yoan-famel/PowerShell/blob/main/Docs/Images/test-center-banner.jpg)

# PowerShell Scripts Repository

Welcome to my repository of PowerShell scripts! 

Here you can find a collection of useful scripts to simplify and automate a range of processes and everyday tasks I have dealt with.

## Table of Contents

- [Introduction](#introduction)
- [Scripts](#scripts)
- [Usage](#usage)
- [Contributing](#contributing)

## Introduction

This repository houses a selection of PowerShell scripts designed to make your life easier. Whether you're a system administrator, or just looking to automate routine tasks, you will find something here to assist you.

Feel free to explore the scripts, try them out, and contribute to the repository if you have improvements or additional scripts to share.

## Scripts

Here is a brief overview of the scripts you will find in this repository:

### Automation
- [enable-wake-on-magic-packets.ps1](https://github.com/yoan-famel/PowerShell/blob/main/Automation/enable-wake-on-magic-packets.ps1): Enables Wake-on-Magic-Packets functionality for a network adapter in a Windows environment, allowing the computer to wake up from a sleep or hibernation state when specific network packets are received.
<br>

- [disk-space-checker.ps1](https://github.com/yoan-famel/PowerShell/blob/main/Automation/disk-space-checker.ps1): This script checks the connectivity status of a specified PC and displays its disk space information if it is online, allowing for interactive monitoring.
<br>

- [get-app-version.ps1](https://github.com/yoan-famel/PowerShell/blob/main/Automation/get-app-version.ps1): This script retrieves and displays the version information of a specified application on a remote PC if it is confirmed to be online.
<br>

- [...]

### Vulnerability Remediation
- [patch-win-defender-elevation.ps1](https://github.com/yoan-famel/PowerShell/blob/main/Vulnerability_Remediation/patch-win-defender-elevation.ps1): This script automates the deployment and execution of a batch file to update Windows Defender, restart Windows Update, and temporarily enable Windows Defender.
<br>

- [update-net-adapter-driver.ps1](https://github.com/yoan-famel/PowerShell/blob/main/Vulnerability_Remediation/update-net-adapter-driver.ps1): This script performs a conditional operation where it checks for the presence of a particular network adapter identified as "Realtek PCIe GbE Family Controller." If the adapter is found on the system, the script proceeds to copy and install a Windows executable. However, if the specified network adapter is not detected, the script terminates without any further action.
<br>

- [patch-java-dev-kit.ps1](https://github.com/yoan-famel/PowerShell/blob/main/Vulnerability_Remediation/patch-java-dev-kit.ps1): This script removes existing Java-related software and installs the latest Java Development Kit (JDK) from Oracle silently.
<br>

- [...]

## Usage

Please note that while some scripts can be used as-is, others may require amendments or configuration adjustments to run in your environment. It is essential to review the code within each file and modify them as needed.

Here's a general guide to running PowerShell scripts:

1. Clone this repository or download the script(s) you need.
2. Open a PowerShell terminal.
3. Navigate to the directory on your system where the script is located using `cd`.
4. Run the script using `./scriptname.ps1`.

Please ensure that you have PowerShell installed and execution policy set to allow running scripts if you encounter any issues.

## Contributing

Contributions are welcome! If you have improvements, bug fixes, or additional scripts you'd like to add, please follow these steps:

1. Fork this repository.
2. Create a new branch for your changes: `git checkout -b feature/new-feature`.
3. Make your changes and commit them: `git commit -m "Add a new feature"`.
4. Push your changes to your fork: `git push origin feature/new-feature`.
5. Create a Pull Request (PR) in this repository's `main` branch.

Your contributions will be reviewed, and if everything looks good, they will be merged.
