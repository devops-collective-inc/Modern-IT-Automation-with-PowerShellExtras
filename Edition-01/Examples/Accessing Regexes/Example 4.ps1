$MyString = 'This sentEnce has infixed cApital leTTErs.'

# Any matches are converted to lowercase
$Evaluator = {
    Write-Host "Run on '$_'"
    ([string]$_.Value).ToLower()
}

$MyString -creplace '(?!\A)\b[a-z]*[A-Z][A-Za-z]*\b', $Evaluator
