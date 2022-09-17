$MyString = 'Antonia is awesome!'
$MyPattern = 'an\w+'

[regex]::IsMatch($MyString, $MyPattern,
    [System.Text.RegularExpressions.RegexOptions]::None)

[regex]::IsMatch($MyString, $MyPattern,
    [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
