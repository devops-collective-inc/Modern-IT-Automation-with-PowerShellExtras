Describe 'Parameter validation and typecasting in mocks' {

    It 'Mock calls with invalid parameters throw errors' {

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
