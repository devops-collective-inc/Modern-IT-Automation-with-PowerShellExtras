$MyPattern =
    '^(?:(?<Octets>25[0-5]|2[0-4][0-9]|[01]?[0-9]{1,2})\.){3}' +
    '(?<Octets>25[0-5]|2[0-4][0-9]|[01]?[0-9]{1,2})$'

$MyRegex = [regex]::new($MyPattern)

$MyMatch = $MyRegex.Match('198.51.100.193')

$Counter = 1

$MyRegex.GetGroupNames()

$MyRegex.GetGroupNumbers()

$MyMatch.Groups['Octets'].Captures | ForEach-Object {
    "Octet $Counter = $_"
    $Counter++
}
