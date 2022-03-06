# Set a specific DNS IP remotely
Set-DnsClientServerAddress -InterfaceAlias Ethernet* -ServerAddresses ("x.x.x.x")

# Set a secondary DNS IP if needed
Set-DnsClientServerAddress -InterfaceAlias Ethernet* -ServerAddresses ("x.x.x.x", "x.x.x.x")

# Retrieve interface index
Get-NetIPInterface

# Revert DNS adresses to auto configuration
Set-DnsClientServerAddress -InterfaceAlias Ethernet* -ResetServerAddresses
