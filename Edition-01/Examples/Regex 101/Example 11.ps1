$MyPattern = 'ab.*?ly'

'absolutely lovely' -match $MyPattern
$Matches[0]
