$MyPattern = '"[^"]+"'

'This is a string with a "quoted" word' -match $MyPattern
$Matches[0]
