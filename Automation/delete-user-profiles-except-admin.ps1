$computer = $env:COMPUTERNAME

$useraccounts = Get-ChildItem -path \\$computer\c$\users\ -Exclude public,[include-profile-names-that-should-be-avoided] | Where-Object {$_.Special -ne 'Special'} | Select-Object Name

$sort = $useraccounts | ForEach-Object {$_.Name}

$removeaccounts = $sort -join "|"

Get-CimInstance -ClassName Win32_UserProfile | Where-Object { $_.LocalPath -match "$removeaccounts"} | Remove-CimInstance 
