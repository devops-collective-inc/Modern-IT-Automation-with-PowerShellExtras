$MyPattern =
    '(?:(?<Octets>25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})\.){3}' +
    '(?<Octets>25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})'

$Tests = [ordered]@{
    'Valid 1'   = '198.51.100.255'  # Valid
    'Valid 2'   = '198.051.100.255' # Valid
    'Invalid 1' = '198.51.256.255'  # Block 3 invalid >255
    'Invalid 2' = '198.51.100.256'  # Block 4 invalid >255
}

$Tests.Keys.ForEach{
    $Result = [regex]::Match($Tests[$_], $MyPattern)
    $Match = $Result.Success ? $Result.Value : '-'
    [pscustomobject]@{
        Test  = $_
        Input = $Tests[$_]
        Match = $Match
    }
}
