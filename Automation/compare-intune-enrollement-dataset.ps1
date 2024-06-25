if (!(Get-Module -ListAvailable -Name ImportExcel)) {
    Install-Module -Name ImportExcel -Force
}
Import-Module ImportExcel

$excelFile1 = "W:\online_rmm_not_registered.xlsx"
$excelFile2 = "W:\on_intune.xlsx"
$outputFile = "W:\not_on_intune.xlsx"

$data1 = Import-Excel -Path $excelFile1 -WorksheetName 'on_ninja'
$data2 = Import-Excel -Path $excelFile2 -WorksheetName 'on_intune'

$array1 = $data1 | Select-Object -ExpandProperty Column1
$array2 = $data2 | Select-Object -ExpandProperty Column1

$missingEntries = $array1 | Where-Object { $_ -notin $array2 }
$missingEntries | ForEach-Object { [PSCustomObject]@{Column1 = $_} } | Export-Excel -Path $outputFile -WorksheetName 'NotOnIntune' -AutoSize
