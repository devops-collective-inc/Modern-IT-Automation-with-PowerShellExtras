$MyString = @'
[2020-07-16T19:50:31] [PATCH] Service "xrdp" installed by "apt"
[2020-07-16T20:25:23] [INFO ] Service [2896] started
[2020-07-16T20:25:26] [DEBUG] Service [2896] ready
'@

$Patterns = @(
    '(?m)^\[([^\]T]+)T([^\]]+)\] ' +
        '\[(INFO|PATCH|DEBUG|WARN|ERROR|FATAL) ?\] (?<msg>.+)$'
    '(?m)^(WARN|PATCH)(?= )'
    '(?m)^INFO(?= )'
    '(?m)^DEBUG(?= )'
)

$Replacements = @(
    '$3 message at $2 on $1{0}    ${{msg}}{0}' -f [Environment]::NewLine
    '$1ING'
    'INFORMATIONAL'
    'DEBUGGING'
)

for ($i = 0; $i -lt $Patterns.Count; $i++) {
    $MyString = $MyString -replace $Patterns[$i], $Replacements[$i]
}

$MyString
