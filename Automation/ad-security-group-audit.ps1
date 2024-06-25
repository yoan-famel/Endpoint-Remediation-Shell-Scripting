# Ensure the necessary modules are installed
if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Install-Module -Name ActiveDirectory -Force
}
if (-not (Get-Module -ListAvailable -Name ImportExcel)) {
    Install-Module -Name ImportExcel -Force
}

Import-Module ActiveDirectory
Import-Module ImportExcel

# Define the OU and the output file path
$ou = "OU=placeholder,DC=placeholder,DC=com"
$outputFile = "W:\placeholder\placeholder.xlsx"

# Initialize an array to hold the results
$results = @()

# Get all groups in the specified OU
$groups = Get-ADGroup -Filter * -SearchBase $ou

foreach ($group in $groups) {
    # Get the direct members of the group
    $members = Get-ADGroupMember -Identity $group.DistinguishedName -Recursive:$false
    $memberNames = $members | ForEach-Object { $_.SamAccountName }
    
    # Add each member to the results array with the group name
    foreach ($member in $memberNames) {
        $results += [PSCustomObject]@{
            GroupName = $group.Name
            MemberName = $member
        }
    }
}

# Export the results to an Excel file
$results | Export-Excel -Path $outputFile -AutoSize
Write-Output "Export completed: $outputFile"
