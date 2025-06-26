![alt text](https://github.com/yoan-famel/PowerShell/blob/main/Docs/Images/test-center-banner.jpg)

# Scripts Repository

![Visitor Badge](https://visitor-badge.glitch.me/badge?page_id=yoan-famel.Endpoint-Remediation)

Welcome to my scripts repository.

This is a collection of scripts I've written to help automate and simplify various tasks and processes I've encountered in my day-to-day work. They're practical, lightweight, and meant to save time across common scenarios.

## Table of Contents

- [Intro](#intro)
- [Scripts](#scripts)
- [Usage](#usage)
- [Contributing](#contributing)

## Intro

This repo includes mainly PowerShell scripts I've written to save time and make repetitive tasks easier to deal with.
If you're managing systems, dealing with incident response and remediations or just want to automate repetitive things, you'll probably find something useful here.

Check out the scripts, test what you need, and feel free to contribute if you’ve got improvements or ideas to add.

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

Please note that while some scripts can be used as-is, others may require amendments or configuration adjustments to run in your environment.
In some cases it could be a good idea to review them, some are standalones while others can be fully integrated to detections/remediations from the get go to Intune.
Since most are PowerShell for now anyway :)

Here's a general guide to running PowerShell scripts:

1. Clone the repo or download the script(s) you need.
2. Open a PowerShell terminal.
3. Navigate to the directory on your system where the script is located using `cd`.
4. Run the script using `./scriptname.ps1`.
5. Or tweak them/add them to your endpoint management system.

Ensure that you have PowerShell installed, run as admin and execution policy set to allow running scripts if you encounter any issues.

## Contributions

Contributions are welcome. :) If you have suggested improvements, bug fixes, or additional scripts you'd like to add, please do get in touch.

1. Fork this repository.
2. Create a new branch for your changes: `git checkout -b feature/new-feature`.
3. Make your changes and commit them: `git commit -m "Add a new feature"`.
4. Push your changes to your fork: `git push origin feature/new-feature`.
5. Create a Pull Request (PR) in this repository's `main` branch.

Enjoy!
