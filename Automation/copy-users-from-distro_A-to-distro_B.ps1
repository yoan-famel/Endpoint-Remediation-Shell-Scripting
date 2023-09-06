#List Members
Get-ADGroupMember -Identity "List_X" | Select-Object Name | Sort-Object Name

#Copy From To
Get-ADGroupMember -Identity "List_A" | ForEach-Object {Add-ADGroupMember -Identity "List_B" -Members $_.distinguishedName}
