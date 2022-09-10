$FormattedDate = Get-Date -Format 'yyyyMMddTHHmm'
$Count = (
    Get-Service | Where-Object {
        ($_.Status -eq 'Stopped') -and ($_.StartType -eq 'Automatic')
    }
).Count
$MyCustomObject = [PSCustomObject]@{
    DateTime = $FormattedDate
    Count    = $Count
}
$MyCustomObject |
    Export-Csv 'C:\temp\StoppedServices.csv' -NoTypeInformation -Append

Get-Content 'C:\temp\StoppedServices.csv'
