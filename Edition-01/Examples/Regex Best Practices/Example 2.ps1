$BadSentence = 'lots of words ' * 100
$OldPattern = '(?m)\b(?>([\w"''\(\)/-]+)[;,]?\s*)+[.?!]+'
$NewPattern = '(?m)(?<=^\s*|[.?!]\s+)(?>([\w"''\(\)/-]+)[;,]?\s*)+[.?!]+'

Write-Host (
    'Old pattern: {0} ms' -f (
        Measure-Command { [regex]::Matches($BadSentence, $OldPattern) }
    ).TotalMilliseconds
)

Write-Host (
    'New pattern: {0} ms' -f (
        Measure-Command { [regex]::Matches($BadSentence, $NewPattern) }
    ).TotalMilliseconds
)
