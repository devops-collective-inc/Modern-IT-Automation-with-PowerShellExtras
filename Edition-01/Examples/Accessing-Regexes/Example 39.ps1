$NoWhiteSpace = [regex]::new('([A-Za-z]:)?(\\+(?<dir>[^\\/:*?"<>|]*))+')
$WithWhiteSpace = [regex]::new(@'
(               # Unnamed capturing group
    [A-Za-z]        # Match uppercase/lowercase letter a-z
    :               # Match colon
)?              # Match this group 0/1 times (optional)
(               # Unnamed capturing group
    \\+             # Match one or more backslashes
    (?<dir>         # Named capturing group 'dir'
        [^              # Match anything but these characters
        \\/:*?"<>|      # NTFS disallowed chars
        ]*              # Match this class zero or more times
    )               # Match group 'dir' exactly once
)+              # Match this group 1 or more times
'@, 'IgnorePatternWhitespace')

$MyString = 'C:\Program Files\PowerShell\7\Modules'

$NoWhiteSpace.IsMatch($MyString)

$WithWhiteSpace.IsMatch($MyString)
