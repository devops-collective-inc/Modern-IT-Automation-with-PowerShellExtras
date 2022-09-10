$MyString = 'SWdlbCBzaW5kIHRvbGwh'

# Matches valid base-64 strings
$MyPattern = @'
(?nx)                   # Ignore pattern white space, explicit captures
(                       # Unnamed group
    [A-Za-z0-9+/]{4}        # Match 4 B64 chars (A-Z, a-z, 0-9, +, and /)
)+                      # Match one or more instances of group
(                       # Unnamed group
                        # 1st alternative
    [A-Za-z0-9+/]{3}=       # Match 3 B64 chars and "="
|                       #
                        # 2nd alternative
    [A-Za-z0-9+/]{2}==      # Match 2 B64 chars and "=="
)?                      # Match group optionally
'@

if ($MyString -match $MyPattern) {
    Write-Host ('Match: {0}' -f
        -join ([System.Convert]::FromBase64String($Matches[0]) -as [char[]]))
}
