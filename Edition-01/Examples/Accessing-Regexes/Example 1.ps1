$MyString = 'This is the input string'
$MyPattern = '(.*is).*?(?<NamedCapture>\w+ring)'

$Result = $MyString -match $MyPattern

if ($Result -eq $true) {
    $Matches[0]
    $Matches[1]
    $Matches['NamedCapture']
}
