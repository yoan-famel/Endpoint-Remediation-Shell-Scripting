# Remove Teams Machine-Wide Installer
$MachineWide = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "Teams Machine-Wide Installer"}
$MachineWide.Uninstall()
Start-sleep 5

# Reinstall Teams Machine-Wide Installer
$installer = new-object System.Net.WebClient
$installer.DownloadFile("https://aka.ms/teams64bitmsi","C:\Teams_windows_x64.msi")
Start-Process Msiexec.exe -ArgumentList '/i C:\Teams_windows_x64.msi OPTIONS="noAutoStart=true" ALLUSERS=1'
