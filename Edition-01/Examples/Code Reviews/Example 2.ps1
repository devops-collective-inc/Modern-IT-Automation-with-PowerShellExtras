# Review-Comment: Should the function's name follow the verb-noun syntax?
Function GetHelloWorld {

    # Review-Comment: Comparing like this can cause $null to be cast.
    #    You should instead use $null -eq $MyVariable to ensure $null is
    #         not cast.
    If ($MyVariable -eq $null) {
        $MyVariable = 'Hello World'
    }

    # Review-Comment: Is there a better way for output to be displayed?
    Write-Host $MyVariable
}
