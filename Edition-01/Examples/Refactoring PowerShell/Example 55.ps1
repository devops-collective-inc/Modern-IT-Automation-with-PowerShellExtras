# Random Function
function Get-Something {
    Get-Random
}

# Importing CSV
$CSVContent = Import-Csv -LiteralPath 'Example.csv'
$CSVContent2 = Import-Csv -LiteralPath 'Example2.csv'

# Creating temporary directories
$Temp = New-Item -ItemType Directory -Name (New-Guid)
$Temp2 = New-Item -ItemType Directory -Name (New-Guid)

# Filtering CSV with another Object
$Filtered = $CSVContent | Where-Object { $_.Destination -eq 'Temp' }
$Filtered2 = $CSVContent2 | Where-Object { $_.Destination -eq 'Temp' }

# Process some changes
$Filtered | ForEach-Object {
    Copy-Item -Path ($_.Source) -Destination $Temp
}
# Process some other changes
$Filtered2 | ForEach-Object {
    Copy-Item -Path ($_.Source) -Destination $Temp2
}

# Send an Email Confirming the Changes
$Params = @{
    To      = 'helpdesk@contoso.com'
    From    = 'noreply@contoso.com'
    Subject = 'Report'
}
Send-MailMessage @Params
