$InterfaceDescriptions = (Get-NetAdapter | Where-Object {$_.Interfacedescription -eq 'Realtek PCIe GbE Family Controller'}).Interfacedescription

#deploy if condition met
if ($InterfaceDescriptions) {
  Copy-Item -Path "\\source\c$\xxx\drivers\Install_Win10_10063_01162023.exe" -Destination "C:\Install_Win10_10063_01162023.exe" -Force
  Start-Process -FilePath "C:\Install_Win10_10063_01162023.exe" -ArgumentList "/s" -Verb "runas" -Wait
}
else {
  exit
}
