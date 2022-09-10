$MyPattern = '\r?\n'

@'
This is a uniline (single line) string
'@ -match $MyPattern

@'
This is
a multiline string
'@ -match $MyPattern
