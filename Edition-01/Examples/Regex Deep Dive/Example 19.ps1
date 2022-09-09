$MyPattern = '(?m)^(?<First>[\w-[\d]]+)((?: [\w.-[\d]]+)+)? ([\w--[\d]]+)$'
$MyReplacement = '"$2, $+$1"'

$Names = @'
John Smith
Jane Luisa Doe
Joe D. Bloggs
Joe Smith-Bloggs
'@

$Names -replace $MyPattern, $MyReplacement
