$i = [System.Net.Dns]::GetHostName()
ForEach ($i in $pc) {	

	$testCo = Test-Connection -BufferSize 32 -Count 1 -ComputerName $i -Quiet
		
	If ($testCo -eq $true) {
	
		Write-Host "ONLINE" -ForegroundColor Green

		ForEach ($Server in $i) { 
			
			Invoke-Command -ComputerName $i -ScriptBlock {
				$displayAdaptors = get-wmiobject -ComputerName $i win32_VideoController | select caption
				$i, $displayAdaptors | ft -HideTableHeaders
			}
		}
	}  Else {
		
		Write-Host "OFFLINE" -ForegroundColor Red
	}	
}
