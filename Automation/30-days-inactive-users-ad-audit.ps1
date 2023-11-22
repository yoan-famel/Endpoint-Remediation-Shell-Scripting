# Import the Active Directory module
Import-Module ActiveDirectory

# Set the OU distinguished name where you want to search for inactive users (change the values to point to your own DC)
$ouDN = "OU=Glasgow,DC=ptw-i,DC=com"

# Set the number of days of inactivity
$inactiveDays = 30

# Get the current date in a specific format (YYYY-MM-DD)
$dateString = Get-Date -Format "yyyy-MM-dd"

# Generate the output file name with today's date
$outputFileBase = "W:\sys-admin\AD-audits\30-days-inactive-users-audit_$dateString.csv" #change this then map this path to your own drive and keep _$dateString.csv
$outputFile = $outputFileBase
$counter = 1

# Check if the output file already exists and generate a unique name by incrementing the counter
while (Test-Path $outputFile) {
    $outputFile = "W:\sys-admin\AD-audits\30-days-inactive-users-audit_$dateString($counter).csv"
    $counter++
}

# Get the current date and subtract the inactive days
$inactiveDate = (Get-Date).AddDays(-$inactiveDays)

# Query Active Directory for active users who have not logged in for the specified number of days
$inactiveUsers = Get-ADUser -SearchBase $ouDN -Filter {Enabled -eq $true -and LastLogonTimeStamp -lt $inactiveDate} -Properties EmailAddress, LastLogonDate, SamAccountName, ObjectClass

# Export the inactive users' details to a CSV file
$inactiveUsers | Select-Object EmailAddress, SamAccountName, LastLogonDate, ObjectClass | Export-Csv -Path $outputFile -NoTypeInformation
