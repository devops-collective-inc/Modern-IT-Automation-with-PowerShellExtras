# The alternatives are reversed in this example,
# so the tokens matching 0-199 come first
$Template = '(?:(?<Octets>[01]?[0-9]{{1,2}}|2[0-4][0-9]|25[0-5])\.){{3}}' +
    '(?<Octets>[01]?[0-9]{{1,2}}{0}|2[0-4][0-9]|25[0-5])'

# Create 3 patterns using a format string,
# with "{" and "}" doubled up to escape them
$Nothing = $Template -f ''
$Lookahead = $Template -f '(?![0-9])'
$WordBoundary = $Template -f '\b'

$IpsToMatch = @(
    'Address: 198.51.100.42'
    'Address: 198.51.100.193'
    'Address: 198.51.100.254'
)

foreach ($IpAddress in $IpsToMatch) {
    [pscustomobject]@{
        Input        = $IpAddress
        Nothing      = [regex]::Match($IpAddress, $Nothing).Value
        Lookahead    = [regex]::Match($IpAddress, $Lookahead).Value
        WordBoundary = [regex]::Match($IpAddress, $WordBoundary).Value
    }
}
