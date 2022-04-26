Get-ADUser -Identity <UserA_ID> -Properties memberof | Select-Object -ExpandProperty memberof |  Add-ADGroupMember -Members <UserB_ID>
