BeforeAll {
    . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
}

Describe "Parameter validation and typecasting in mocks" {

    It "Mock calls with invalid parameters throw errors" {

        Mock Set-DataStore {
            # Does nothing
        }

        # Bad types for -Data and -Update
        { Set-DataStore -Name 'AName' -Data '' -Update '' } |
            Should -Throw

        # The value of -Update is before 2000
        { Set-DataStore -Name 'AName' -Data @{} -Update ([datetime]0) } |
            Should -Throw

    }

}

Describe "Removing parameter validation and typecasting" {

    BeforeAll {
        Mock Set-DataStore {
            # Does nothing
        } -RemoveParameterValidation Update -RemoveParameterType Update,Data
    }

    It "Succeeds when validation and typecasting are removed" {

        Set-DataStore -Name 'AName' -Data '' -Update ''

        Set-DataStore -Name 'AName' -Data @{} -Update ([datetime]0)

    }

    It "Null values always fail for mandatory parameters" {

        # Name wasn't included in -RemoveParameterValidation
        # or -RemoveParameterType
        { Set-DataStore -Name '' -Data '' -Update '' } |
            Should -Throw
        
        # Update was included in both, but still can't accept $null
        { Set-DataStore -Name 'AName' -Data '' -Update $null } |
            Should -Throw
    
    }

}
