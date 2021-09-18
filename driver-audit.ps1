#Incompatibilities were noticed between the previous virtual display driver and one of our latest SaaS build when the old version was present on C.
#Black screens were observed on a large scale throughout the company, to troubleshoot this issue I came up with this script to identify which driver was installed in order to remove it.
#In some cases it was observed the GPU encoding capability was the main issue, where I used another script. See 'GPU-audit.ps1'.

$computerList = "C:\Storage\vdd-update\lists\pc-list.txt"

ForEach ($computer in (Get-Content $computerList)) {
	
	$testConnection = Test-Connection -Count 2 $computer -ErrorAction 'silentlycontinue'
	
	If ($testConnection -ne $null) {
		
		Write-Host "Analysing $computer ..."
		$oldVddPath = "\\$computer\c$\[placeholder]-driver-0.30.0.0.exe"
		$lastVddPath = "\\$computer\c$\[placeholder]-driver-0.37.0.0.exe"
		$installedOldVddVer = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($oldVddPath).FileVersion
		$installedLastVddVer = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($lastVddPath).FileVersion
		$errorActionPreference = 'silentlycontinue'
					
		If (Test-Path $oldVddPath) { #if one of the driver path exist on C
						
			Write-Host "[placeholder] drivers found on $computer C:\ drive"
						
			If ($installedOldVddVer) { #if old version can be grabbed
								
				Add-content -Path "C:\Storage\vdd-update\[placeholder]-driver-audit-true.txt" "`n$computer `tINSTALLED VERSION [$installedOldVddVer] `tOLD DRIVER ON DRIVE [YES]"
				Write-Host "Searching on the next host ..."
				continue
								
			} ElseIf ($installedLastVddVer) { #if last version can be grabbed
								
				Add-content -Path "C:\Storage\vdd-update\[placeholder]-driver-audit-true.txt" "`n$computer `tINSTALLED VERSION [$installedLastVddVer] `tOLD DRIVER ON DRIVE [NO]"
			}
						
		} ELse {
						
			$errorActionPreference
			Write-Host "[placeholder] drivers not found on $computer C:\"
			#Check in case driver is not on C OR installed / or not on C AND not installed
			#Redirect output to a file for those ones too
			Add-content -Path "C:\Storage\vdd-update\[placeholder]-driver-audit-false.txt" "`n$computer `tDouble check, [placeholder] driver either not found or installed on C:\"
						
		} 
	} Else {
		
		Write-Host "$computer is offline"
		Add-content -Path "C:\Storage\vdd-update\offline-pcs.txt" "`n$computer"	
	} 
}
