$FormattedDate = Get-Date -Format 'yyyyMMddTHHmm'
$Count = (
    Get-Service | Where-Object {
        ($_.Status -eq 'Stopped') -and ($_.StartType -eq 'Automatic')
    }
).Count
"$FormattedDate,$Count" | Tee-Object -Path 'C:\temp\test.csv' -Append
