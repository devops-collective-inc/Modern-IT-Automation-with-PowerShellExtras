# Review-Comment: Fix the name.
Function GetHelloWorld {
    # Review-Comment: Don't compare with $null this way.
    If ($MyVariable -eq $null) {

        $MyVariable = 'Hello World'
    }

    # Review-Comment: Don't display output using Write-Host.
    Write-Host $MyVariable
}
