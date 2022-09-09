$Opts = [System.Text.RegularExpressions.RegexOptions]::None
$Time = [timespan]::FromSeconds(5)

$Guid = '87db9d39-ddc8-413c-84ac-0be925a8230a'
$Pattern = '([0-9a-f]+-?)+\Z'

Write-Host "'$Guid'"
Write-Host (
    [regex]::IsMatch($Guid, $Pattern, $Opts, $Time)
)

$GuidSpace = $Guid + ' '

Write-Host "'$GuidSpace'"
Write-Host (
    [regex]::IsMatch($GuidSpace, $Pattern, $Opts, $Time)
)
