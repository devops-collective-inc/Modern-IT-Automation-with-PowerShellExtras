$params = @{
    URI = 'https://example.com/'
    ErrorAction = 'SilentlyContinue'
    Method = $method ?? 'GET'
}

$result = Invoke-WebRequest @params ?? @{error = 'no response'}
