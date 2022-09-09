$MyRegex = [regex]::new('(\w)(?n)(\w)(?-n)(\w)')

$MyRegex.Match('abc').Groups.ForEach{
    Write-Host $_.Name $_.Value
}
