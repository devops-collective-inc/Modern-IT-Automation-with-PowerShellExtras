$params = @{
    URI = 'https://example.com/'
    ErrorAction = 'SilentlyContinue'
    Method = $(
        if ($method -ne $null) { $method }
        else { 'GET' }
    )
}

$result = Invoke-WebRequest @params
if ($null -eq $result) {
    $result = @{error = 'no response'}
}
