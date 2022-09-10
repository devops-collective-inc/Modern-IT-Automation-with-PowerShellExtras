$MyPattern = '\b(\w+)-\w{6,}-(\w+)\b'

'This is fan-flaming-tastic!' -match $MyPattern
$Matches[0]

$Matches[1], $Matches[2] -join ''
