[System.Text.RegularExpressions.RegexOptions]::Multiline -bor
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

# Regex options use 10 bits, with bit 3 (128) unused
# IgnoreCase = 0000000001 = 1
# Multiline  = 0000000010 = 2
# Both       = 0000000011 = 3
[System.Text.RegularExpressions.RegexOptions]3

[System.Text.RegularExpressions.RegexOptions]3 -band -bnot
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

[System.Text.RegularExpressions.RegexOptions]'multiline, IGNORECASE'
