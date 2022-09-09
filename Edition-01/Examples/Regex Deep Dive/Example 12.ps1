$MyRegex = [regex]::new('(\w)(?-n:(\w))(\w+)', 'ExplicitCapture')

$MyRegex.Match('abc').Groups.ForEach{
    Write-Host $_.Name $_.Value
}
