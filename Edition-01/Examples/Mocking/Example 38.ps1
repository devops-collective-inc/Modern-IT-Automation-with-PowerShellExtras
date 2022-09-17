Describe 'Removing parameter validation and typecasting' {

    BeforeAll {
        Mock Set-DataStore {
            # Does nothing
        } -RemoveParameterValidation Update -RemoveParameterType Update, Data
    }

    It 'Succeeds when validation and typecasting are removed' {

        Set-DataStore -Name 'AName' -Data '' -Update ''
        Set-DataStore -Name 'AName' -Data @{} -Update ([datetime]0)

    }

}
