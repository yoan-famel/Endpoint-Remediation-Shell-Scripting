#	References
#	-----
#	PnpDevice
#	https://docs.microsoft.com/en-us/powershell/module/pnpdevice/get-pnpdevice?view=windowsserver2019-ps
#	
#	DevCon
#	Has to be installed under c$\Windows\System32\
#	https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon-general-commands	
#
#	[placeholder]SdkDebugger
#	https://switchbrew.org/wiki/TMA_services
#
#	Notes
#	
#	devcon.exe disable 'USB\VID_057E*'
#	-----
#	Won't work if a user is connected to the target as a PC reboot is needed
#	Won't work if disconnected either, PC reboot needed
#	Won't work if [placeholder]] is not running, PC reboot needed
#	Seems to work after using devcon.exe restart 'USB\VID_057E*' with [placeholder]] closed
#	Not able to connect to the target with error_39 in [placeholder]] logs if not followed by devcon.exe enable 'USB\VID_057E*'
#	
#	devcon.exe enable 'USB\VID_057E*'
#	-----
#	[...]
#
#	devcon.exe disable 'USB\VID_057E*'
#	-----
#	[...]
#
#	...More tests to come...
#	Commenting Invoke-Command for now, GPOs or SPNs active
#	
#	So far devcon doesn't seem to be stable with [placeholder] as in doesn't work in 100%, need to find the right commands order restart/disable/enable and/or restart again if needed
#	
#	Would allow consoles to be reconnected across studios if it works
#
#	Could be launched remotely from Ops or locally by testers 

#shared location to define
#$devConInstaller = "C:\Storage\devcon.exe"

$devConInstaller = "\\ptw-i.com\lqa\Software\All_Software\Parsec\devcon.exe"

$i = Read-Host "PC"

ForEach ($pc in $i) {
		
		$testCo = Test-Connection -BufferSize 32 -Count 1 -ComputerName $i -Quiet
		
		If ($testCo -eq $true) {
			
			Write-Host "$i ONLINE" -ForegroundColor Green
			
			#1. Install devcon to remote system or locally
			$installationPath = "\\$i\C$\Windows\System32\"
			$EXE = "\\$i\C$\Windows\System32\devcon.exe"
			If (Test-Path -Path $EXE -PathType leaf) {
				
				Write-Host "Device Console was already copied to System32." -ForegroundColor Green
				
			} Else {
				
				Copy-Item -Path $devConInstaller -Destination $installationPath -Force
				Write-Host "...Copying file."
				Start-Sleep -s 10
				Write-Host "Device Console copied to System32." -ForegroundColor DarkCyan
			}
			
			#2. Find and kill [placeholder]] process
			#Invoke-Command -ComputerName $i -ScriptBlock {
				
				$get[placeholder]] = Get-Process -Name "[placeholder]TargetManager" -ErrorAction SilentlyContinue
			
				If ($get[placeholder]] -eq $null) {
				
				Write-Host "[placeholder] Target Manager is not running ...Continuing." -ForegroundColor Yellow
				
				} Else {
				
					$kill_[placeholder]] = Stop-Process $get[placeholder]]
					
					If ($?) {
					
						Write-Host "[placeholder] Target Manager was stopped successfully." -ForegroundColor Green
					}
				}	
			#}
			
			#3. Get SDK device IDs if the console status is OK
			
			#Define other statuses here with if statement to prevent error codes with pop up window if console is not detected, loop to retry until fixed maybe
			$getSDK_Status = Get-PnpDevice -InstanceID 'USB\VID_057E*' -Status OK
			
			If ($?) {
				
				#i.e USB\VID_057E&PID_3000\XAL03100094870
				$getSDK_Full_ID = Get-PnpDevice -FriendlyName "[placeholder]SdkDebugger" -Status OK -PresentOnly | Select-Object -Property InstanceId
					
					Write-Host "[--------[placeholder]--------]"
					#substring syntax is (from char position, total char amount)
					$getSDK_vendor_ID = $getSDK_Full_ID.InstanceId.Substring(8,4)
					Write-Host "Vendor ID . . . . . . . . . $getSDK_vendor_ID"
					$getSDK_PID = $getSDK_Full_ID.InstanceId.Substring(13,8)
					Write-Host "Product ID . . . . . . . .  $getSDK_PID"
					$getSDK_ID = $getSDK_Full_ID.InstanceId.Substring(22,14)
					Write-Host "[placeholder] ID . . . .  $getSDK_ID"
				
				
				Write-Host "$getSDK_ID is reachable. ...Restarting [placeholder]SdkDebugger driver." -ForegroundColor Green
				For ($load = 0; $load -le 5; $load++) {
					Start-sleep -m 500
					Write-host “.” -nonewline
					Start-sleep -m 500
				}
				
				#4. Restart and enable the SDK driver
				<#Invoke-Command -ComputerName $i -Scriptblock {#> devcon.exe restart "USB\VID_057E&PID_3000*" #}>
				For ($load = 0; $load -le 5; $load++) {
					Start-sleep -m 500
					Write-host “.” -nonewline
					Start-sleep -m 500
				}
				
				#note that 'Result: (Error_23) Connect failed.' shows up if not enabled - not able to connect to SDK through [placeholder]] UI
				<#Invoke-Command -ComputerName $i -Scriptblock {#> devcon.exe enable "USB\VID_057E&PID_3000*" #}>
				For ($load = 0; $load -le 5; $load++) {
					Start-sleep -m 500
					Write-host “.” -nonewline
					Start-sleep -m 500
				}	
					
				<#Invoke-Command -ComputerName $i -Scriptblock {#> devcon.exe restart "USB\VID_057E&PID_3000*"
					
			
				#5. Recheck status and re run [placeholder]]
				
					$recheck_SDK_Status = Get-PnpDevice -InstanceID 'USB\VID_057E*' -Status OK 
				#}
				
				If ($?) {
					
					Write-Host "$getSDK_ID Replugged! ...Launching [placeholder] Target Manager." -ForegroundColor Green
					
					#Invoke-Command -ComputerName $i -Scriptblock {
						
						$[placeholder]]_executable = "\\$i\C$\Program Files\[placeholder]\Oasis\bin\[placeholder]TargetManager.exe"
						Start-Process $[placeholder]]_executable
						Start-Sleep -s 2
						
						#send all is well to user
						Add-Type -AssemblyName PresentationCore,PresentationFramework
						$ButtonType = [System.Windows.MessageBoxButton]::OK
						$MessageboxTitle = "$getSDK_ID"
						$Messageboxbody = "[placeholder] reconnected."
						$MessageIcon = [System.Windows.MessageBoxImage]::Information
						$result = [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)
					#}
					
				#to adjust with comment on line 92, store error statuses into variables
				#Get-PnpDevice -Status	 Specifies an array of current status values of devices. The acceptable values for this parameter are:
				#	OK
				#	ERROR
				#	UNKNOWN
				#	DEGRADED
				} ElseIf ($recheck_SDK_Status = Get-PnpDevice -InstanceID 'USB\VID_057E*' -Status Error) {
					
					Write-Host "An error occured."
				}
				
			} Else {
			
				#Study other error code cases than 'error_39' and statuses to improve the script
				Write-Host "SDK is not reachable." -ForegroundColor Red
			}	
		
			
		} Else {
			
			Write-Host "$i OFFLINE" -ForegroundColor Red
		}
}