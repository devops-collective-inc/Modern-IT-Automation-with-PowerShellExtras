# CSV format:
# "Source","Destination"

# Importing CSV
$CSVContent = Import-Csv -LiteralPath 'Example.csv'
# Filtering CSV with another Object
$Filtered = $CSVContent | Where-Object { $_.Destination -eq 'Temp' }
# Process some changes
$Temp = New-Item -ItemType Directory -Name (New-Guid)
$Filtered | ForEach-Object {
    Copy-Item -Path ($_.Source) -Destination $Temp
}
$CSVContent2 = Import-Csv -LiteralPath 'Example2.csv'
# Filtering CSV with another Object
$Filtered2 = $CSVContent2 | Where-Object { $_.Destination -eq 'Temp' }
# Process some changes
$Temp2 = New-Item -ItemType Directory -Name (New-Guid)
$Filtered2 | ForEach-Object {
    Copy-Item -Path ($_.Source) -Destination $Temp2
}
# Random Function
function Get-Something {
    Get-Random
}
# Send an Email Confirming the Changes
$Params = @{
    To      = 'helpdesk@contoso.com'
    From    = 'noreply@contoso.com'
    Subject = 'Report'
}
Send-MailMessage @Params
