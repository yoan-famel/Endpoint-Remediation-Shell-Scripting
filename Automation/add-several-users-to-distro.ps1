# Import bulk users in a previously created distribution list on Exchange

Import-Csv .\distro-users.csv | ForEach-Object {Add-DistributionGroupMember distro_name -Member $_.csv_header}
Get-DistributionGroupMember distro_name
