$MyString = @'
52.44043425089714, -2.1832003074046074
35.838058817549914, 14.544060183946005
50.61179108261999, -3.4566678290794117
28.99748439438466, -13.489740628401105
'@
$MyPattern = '^35\.\d+, *14\.\d+$'

[regex]::IsMatch($MyString, $MyPattern, 'None')

[regex]::IsMatch($MyString, $MyPattern, 'Multiline')
