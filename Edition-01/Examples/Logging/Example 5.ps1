$FormattedDate = Get-Date -Format 'yyyyMMddTHHmm'
$Count = (
    Get-Service | Where-Object {
        ($_.Status -eq 'Stopped') -and ($_.StartType -eq 'Automatic')
    }
).Count

$Params = @{
    Path  = 'C:\temp\test.csv'
    Value = "$FormattedDate,$Count"
}
if ($ClearLog) {
    $Params.Value = @('"DateTime","Count"', $Params.Value)
    Set-Content @Params
}
else {
    Add-Content @Params
}
