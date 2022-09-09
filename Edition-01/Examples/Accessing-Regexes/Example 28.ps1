$MyString = '[21:20:06] [ERROR] Service [2952] stopped unexpectedly'

$MyRegex = [regex]::new('\[(\w+)\]')

# Max 1 replacement, starting at position 1 (2nd character)
# Skips first square brackets as this begins at position 0
$MyRegex.Replace($MyString, '$1:', 1, 1)
