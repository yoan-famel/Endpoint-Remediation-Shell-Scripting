# A quick script that returns online statuses and IPs of several hosts at once.
# Really handy when bunch of PCs are moved around every so often that way I can determine whether or not they are on a VLAN.

$computerList = "C:\Storage\lists\ping-list.txt"

ForEach ($computer in (Get-Content $computerList)) {
	
	$testConnection = Test-Connection -Count 2 $computer -ErrorAction 'silentlycontinue'
	
	If ($testConnection -ne $null) {
		
		Invoke-Command -ComputerName (Get-Content $computerList) -Scriptblock {
			$IPv4 = $env:HostIP = (
				Get-NetIPConfiguration |
				Where-Object {
					$_.IPv4DefaultGateway -ne $null -and
					$_.NetAdapter.Status -ne "Disconnected"
				}
			).IPv4Address.IPAddress
		}
		
		Write-Host "$computer ONLINE - $IPv4"

	} Else {
		
		Write-Host "$computer OFFLINE"	
	} 
}
