$MyMatch = [regex]::Match('aabccdde', '(?i)(\w)\1')

while ($MyMatch.Success) {
    'Found repeat: {0}' -f $MyMatch.Value
    $MyMatch = $MyMatch.NextMatch()
}
