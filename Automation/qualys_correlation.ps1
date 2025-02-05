#  1st
#      tags.name:["Sites"]
#  2nd
#      tags.name:["Sites"]
#      vulnerabilities.status:[FIXED]

if (!(Get-Module -ListAvailable -Name ImportExcel)) {
    Install-Module -Name ImportExcel -Force
}
Import-Module ImportExcel

$x1 = "D:\..\..\placeholder.xlsx"
$x2 = "D:\..\..\placeholder.xlsx"
$output = "D:\output\..\..\placeholder.xlsx"

$d1 = Import-Excel -Path $x1 -WorksheetName '_enrolled'
$d2 = Import-Excel -Path $x2 -WorksheetName '_not_enrolled'

$k = "Netbios"
$a1 = $d1 | Select-Object -ExpandProperty $k
$a2 = $d2 | Select-Object -ExpandProperty $k
$a1 = $a1 | Where-Object { $_ -and $_.Trim() } | ForEach-Object { $_.ToLower() }
$a2 = $a2 | Where-Object { $_ -and $_.Trim() } | ForEach-Object { $_.ToLower() }

$m_Entries = $d1 | Where-Object { ($_.Netbios -as [string]).ToLower() -notin $a2 }
if ($m_Entries.Count -gt 0) {
    $m_Entries | Export-Excel -Path $output -WorksheetName '_unjoined' -AutoSize
    Write-Host "$output"
} else {
    Write-Host "none"
}
