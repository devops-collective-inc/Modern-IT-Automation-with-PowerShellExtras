$MyPattern = 'ab.*ly'

'absolutely' -match $MyPattern
$Matches[0]

'ably' -match $MyPattern
$Matches[0]

'absolutely lovely' -match $MyPattern
$Matches[0]
