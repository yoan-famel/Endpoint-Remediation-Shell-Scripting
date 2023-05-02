#Only allow a magic packet to wake the computer
$nicMagicPacketOnly = Get-WmiObject MSNdis_DeviceWakeOnMagicPacketOnly -Namespace root\wmi | where {$_.instancename -match [regex]::escape($nic.PNPDeviceID) }
$nicMagicPacketOnly.EnableWakeOnMagicPacketOnly = $True
$nicMagicPacketOnly.psbase.Put()
start-sleep -seconds 2

#Enable wake on magic packets - net adapter takes 5 sec to restart
$adapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up'}
Enable-NetAdapterPowerManagement -Name $adapter.Name -WakeOnMagicPacket
