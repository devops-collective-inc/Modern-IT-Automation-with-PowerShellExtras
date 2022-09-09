$LongString = ('This is a single sentence. ' * 1e5).Trim()

Write-Host ('String length: {0:n0} chars' -f $LongString.Length)

# Matches multiple sentences
# WARNING: This pattern backtracks catastrophically with invalid input
$OneCapture = [regex]::Matches($LongString,
    '(?m)\b(?:([\w"''\(\)/-]+)[;,]?\s*)+[.?!]+')
$TwoCaptures = [regex]::Matches($LongString,
    '(?m)\b(([\w"''\(\)/-]+)[;,]?\s*)+[.?!]+')

Write-Host (
    'One capture: {0} ms' -f
    (Measure-Command { $OneCapture.Count }).TotalMilliseconds
)

Write-Host (
    'Two captures: {0} ms' -f
    (Measure-Command { $TwoCaptures.Count }).TotalMilliseconds
)
