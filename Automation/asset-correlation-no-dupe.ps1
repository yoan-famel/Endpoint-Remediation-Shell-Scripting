if (!(Get-Module -ListAvailable -Name ImportExcel)) {
    Install-Module -Name ImportExcel -Force
}
Import-Module ImportExcel

$x1 = "D:\..\..\placeholder.xlsx"
$x2 = "D:\..\..\placeholder.xlsx"
$output = "D:\output\..\..\placeholder.xlsx"

$d1 = Import-Excel -Path $x1
$d2 = Import-Excel -Path $x2

$combined = $d1 + $d2 | 
    Sort-Object -Property Netbios -Unique
$combined | Export-Excel -Path $output -WorksheetName 'CombinedData' -AutoSize
Write-Host "$output"
