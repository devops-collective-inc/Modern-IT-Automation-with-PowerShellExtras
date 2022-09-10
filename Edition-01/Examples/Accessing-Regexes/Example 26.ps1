$MyMatches = [regex]::Matches('aabccdde', '(?i)(\w)\1')

foreach ($match in $MyMatches) {
    'Found repeat: {0}' -f $match.Value
}
