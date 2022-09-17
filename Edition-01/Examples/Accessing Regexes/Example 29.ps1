$MyString = 'This sentEnce has infixed cApital leTTErs.'

$MyRegex = [regex]::new('(?<!\A)\b[a-z]*[A-Z][A-Za-z]*\b')

$Evaluator = {
    param ($MyMatch)
    Write-Host "Run on '$MyMatch'"

    # Any matches are converted to lowercase
    ([string]$MyMatch.Value).ToLower()
}

# Max 2 replacements, starting at position 0 (1st character)
$MyRegex.Replace($MyString, $Evaluator, 2, 0)
