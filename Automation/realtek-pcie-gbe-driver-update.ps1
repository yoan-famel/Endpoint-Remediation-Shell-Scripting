# Work in progress ...

$InterfaceDescriptions = (Get-NetAdapter | Where-Object {$_.Interfacedescription -eq 'Realtek PCIe GbE Family Controller'}).Interfacedescription

#deploy realtek driver if true
if ($InterfaceDescriptions) {
  Invoke-WebRequest 'https://realtekcdn.akamaized.net/rtdrivers/cn/nic1/Install_Win10_10063_01162023.zip?__token__=exp=1676893057~acl=/rtdrivers/cn/nic1/Install_Win10_10063_01162023.zip~hmac=b5d2f6e6e61ecea3f494931c16fa804484ba05bdd3e2ec88c9338eecf3bbe9ac' -Outfile 'C:\Install_Win10_10063_01162023.zip'
  #Expand-Archive -Path "C:\Install_Win10_10063_01162023.zip" -DestinationPath 'C:\' -Force
  #Start-Process -FilePath "C:\Install_Win10_10063_01162023.exe" -ArgumentList "/s" -Verb "runas" -Wait
}
else {
  exit
}
