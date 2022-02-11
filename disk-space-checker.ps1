$DSC_intro = @"
 ___   _   __   _         __   ___    __    __    ____      __    _     ____  __    _     ____  ___  
| | \ | | ( (` | |_/     ( (` | |_)  / /\  / /`  | |_      / /`  | |_| | |_  / /`  | |_/ | |_  | |_) 
|_|_/ |_| _)_) |_| \     _)_) |_|   /_/--\ \_\_, |_|__     \_\_, |_| | |_|__ \_\_, |_| \ |_|__ |_| \                                                        
"@
Write-Host $DSC_Intro -ForegroundColor Red
Write-Host '====================================================================================' -ForegroundColor Red
Write-Host ''
Write-Host 'Enter a PC below' -ForegroundColor Red
Write-Host ''

while ($true) {
	$i = Read-host 'Hostname'
	Write-Host "Testing connection"	

	ForEach ($Nodes in $i) {

		$testCo = Test-Connection -BufferSize 32 -Count 1 -ComputerName $i -Quiet

		If ($testCo -eq $true) {
	
			Write-Host "... $i ONLINE !" -ForegroundColor Green
    			$space = Get-WmiObject Win32_LogicalDisk -ComputerName $i -Filter DriveType=3 |
    			Select-Object SystemName, DeviceID, @{'Name'='DiskSpace'; e={[math]::Round($_.size / 1GB,2)}}, @{'Name'='FreeSpace'; e={[math]::Round($_.freespace / 1GB,2)}}, @{'Name'='Date'; e={(Get-Date -format G)}} |
    			ft -HideTableHeaders

			Write-Host 'HOSTNAME   DRIVE     SIZE [GB]    FREESPACE [GB]  DATE/TIME' -ForegroundColor Red

		} Else {

			Write-Host "...OFFLINE" -ForegroundColor Red
		}
	}

	$space
	Read-host 'Press CTRL + C to quit or press ENTER to continue'
}
