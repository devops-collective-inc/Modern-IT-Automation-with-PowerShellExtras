$MyString = @'
This string has a "quoted section
across two lines."
'@
$MyPattern = '".+?"'

[regex]::IsMatch($MyString, $MyPattern)

[regex]::IsMatch($MyString, $MyPattern, 'singleLINE')
