$MyPattern = '^[^"]*(?:(?:(?<StartQuote>(?=[\p{P} ]|^)")[^"]*)+' +
    '(?:(?<Quotes-StartQuote>"(?=[\p{P} ]|$))[^"]*)+)*(?(StartQuote)(?!))$'

$BalancedQuotes = '"Hello?", I queried. The stranger replied, ' +
    '"Why is "Hello" a question?".'

$UnbalancedQuotes = 'Hello?", I queried. The stranger replied, ' +
    '"Why is "Hello" a question?".'

$ResultBalanced = [regex]::Match($BalancedQuotes, $MyPattern)
$ResultUnbalanced = [regex]::Match($UnbalancedQuotes, $MyPattern)

Write-Host 'Balanced match:' $ResultBalanced.Success
Write-Host 'Unbalanced match:' $ResultUnbalanced.Success

Write-Host (
    'Balanced StartQuote capture count: ' +
    $ResultBalanced.Groups['StartQuote'].Captures.Count
)

Write-Host 'Quoted phrases from balanced string:'
$ResultBalanced.Groups['Quotes'].Captures | Format-Table
