# Options equivalent to (?mi)
# Note the bitwise or operator used to combine options
$MyRegexOpts =
    [System.Text.RegularExpressions.RegexOptions]::Multiline -bor
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

# 500 ms match time-out
$MyRegexTimeout = [timespan]::FromMilliseconds(500)

$MyRegex = [regex]::new(
    '\[(?:error|warn *)\]', $MyRegexOpts, $MyRegexTimeout
)

$MyRegex
