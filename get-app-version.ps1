while ($true) {

	$i = Read-Host "PC"
	
	ForEach ($i in $pc) {	

	$testCo = Test-Connection -BufferSize 32 -Count 1 -ComputerName $i -Quiet
	
	If ($testCo -eq $true) {

		Invoke-Command -ComputerName $i -ScriptBlock {
			ForEach ($Server in $i) {
				$appVersion = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, InstallDate | where {$_.DisplayName -like "*[placeholder]*"} | ft -HideTableHeaders
				$appVersion
			}
		}
		
	} Else {
		
		Write-Host "OFFLINE" -ForegroundColor Red
	}
}
