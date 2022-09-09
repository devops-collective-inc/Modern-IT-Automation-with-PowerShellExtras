$MyRegex = [regex]::new(@'
(?xm-i)     # Ignore white space and multiline ON, case insensitivity OFF
^           # Start of line because multiline is on
[a-z]{2}    # 2 lowercase letters
(?i)        # Turn on case insensitivity
-[a-z]{2}   # Hyphen followed by 2 letters of any case
'@, 'IgnoreCase')

$MyRegex.Matches(@'
en-US
en-us
EN-us
en-GB
'@).ForEach{ $_.Value }
