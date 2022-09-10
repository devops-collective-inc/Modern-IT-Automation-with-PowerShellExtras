# Random Function
function Get-Something {
    Get-Random
}

# (NOTE: A blank line is inserted above to separate groups)
# (NOTE: The CSV imports are the same so they can be grouped together.)
# Importing CSV
$CSVContent = Import-Csv -LiteralPath 'Example.csv'
$CSVContent2 = Import-Csv -LiteralPath 'Example2.csv'

# (NOTE: A blank line is inserted above to separate groups)
# (NOTE: The directory creations are the same so they can be grouped together.)
# Creating temporary directories
$Temp = New-Item -ItemType Directory -Name (New-Guid)
$Temp2 = New-Item -ItemType Directory -Name (New-Guid)

# (NOTE: A blank line is inserted above to separate groups)
# (NOTE: Where-Object calls are the same so they can be grouped together.)
# Filtering CSV with another Object
$Filtered = $CSVContent | Where-Object { $_.Destination -eq 'Temp' }
$Filtered2 = $CSVContent2 | Where-Object { $_.Destination -eq 'Temp' }

# (NOTE: A blank line is inserted above to separate groups)
# (NOTE: The following code is similar so it can be grouped together.)
# Process some changes
$Filtered | ForEach-Object {
    Copy-Item -Path ($_.Source) -Destination $Temp
}
# Process some other changes
$Filtered2 | ForEach-Object {
    Copy-Item -Path ($_.Source) -Destination $Temp2
}

# (NOTE: A blank line is inserted above to separate groups)
# Send an Email Confirming the Changes
$Params = @{
    To      = 'helpdesk@contoso.com'
    From    = 'noreply@contoso.com'
    Subject = 'Report'
}
Send-MailMessage @Params
