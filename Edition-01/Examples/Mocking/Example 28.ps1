# Same Describe block as Example 22
Context 'Mock tests' {

    It 'Accesses data stores and API at least once' {
        Should -InvokeVerifiable
    }
    It 'Calls Invoke-RestMethod 4 times overall' {
        Should -Invoke Invoke-RestMethod -Exactly 4 -Scope Describe
    }
    It 'Calls Invoke-RestMethod 3 times for update URL' {
        Should -Invoke Invoke-RestMethod -ParameterFilter {
            $Uri -match '.+/updates$'
        } -Exactly 3 -Scope Describe
    }
    It 'Calls Invoke-RestMethod once for data URL' {
        Should -Invoke Invoke-RestMethod -ParameterFilter {
            $Uri -match '/data/\d+$'
        } -Exactly 1 -Scope Describe
    }

}
