$MockParams = @{
    Type = 'System.Globalization.CultureInfo'
    Properties = @{
        Parent = 'en'
        LCID   = 1931
        Name   = 'en-mm'
        DisplayName = 'Mocked Culture'
    }
    Methods = @{
        GetConsoleFallbackUICulture = {
            return Get-Culture -Name 'en-US'
        }
    }
}
$Culture = New-MockObject @MockParams

# Example 44a: A real CultureInfo
Get-Culture

# Example 44b: The mocked one
$Culture

# Example 44c: A mocked method
$Culture.GetConsoleFallbackUICulture()
