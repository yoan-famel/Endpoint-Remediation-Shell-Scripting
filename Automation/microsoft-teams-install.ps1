$installer = new-object System.Net.WebClient
$installer.DownloadFile("https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true","C:\Teams_windows_x64.msi")

Start-Process Msiexec.exe -ArgumentList '/i C:\Teams_windows_x64.msi OPTIONS="noAutoStart=true" ALLUSERS=1'
