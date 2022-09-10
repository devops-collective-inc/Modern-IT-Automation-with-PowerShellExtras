$FormattedDate = Get-Date -Format 'yyyyMMddTHHmm'
Get-Service |
    Where-Object {
        ($_.Status -eq 'Stopped') -and ($_.StartType -eq 'Automatic')
    } |
    Out-File "C:\temp\StoppedServices-$FormattedDate.txt"
