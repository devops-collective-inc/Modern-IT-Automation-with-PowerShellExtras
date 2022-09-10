# Same Describe block as Example 38
It 'Null values always fail for mandatory parameters' {

    # Name wasn't included in -RemoveParameterValidation
    # or -RemoveParameterType
    { Set-DataStore -Name '' -Data '' -Update '' } |
        Should -Throw

    # Update was included in both, but still can't accept $null
    { Set-DataStore -Name 'AName' -Data '' -Update $null } |
        Should -Throw

}
