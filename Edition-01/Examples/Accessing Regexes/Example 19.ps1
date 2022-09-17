function MyFunction {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidatePattern('^\w+\b\s*\b\w+$')]
        [string]
        $Words
    )
    Write-Host "The function ran with string = '$Words'"
}

MyFunction -Words 'hello world'
MyFunction -Words 'hello'
