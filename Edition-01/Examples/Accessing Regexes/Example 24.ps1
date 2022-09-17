$MyString = '[ERROR] /dev/sdc1 is full'
$MyPattern = '(?mi)^\[(?<type>error|warn *)\] *(?<msg>.+$)'

$MyMatch = [regex]::Match($MyString, $MyPattern)

$MyMatch.Success

$MyMatch.Groups | Select-Object -ExcludeProperty Groups, ValueSpan |
    Format-Table

'Message kind: {0}. Message: {1}' -f
    $MyMatch.Groups['type'].Value,
    $MyMatch.Groups['msg'].Value
