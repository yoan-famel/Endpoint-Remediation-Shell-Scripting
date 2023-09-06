Set-Itemproperty -path 'HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore' -Name 'RequirePrivateStoreOnly' -value 0 -type DWORD
Start-sleep -seconds 3
wsreset.exe
