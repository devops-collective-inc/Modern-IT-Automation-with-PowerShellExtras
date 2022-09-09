# Same Describe block as Example 10

# Example 11a:
Context 'Inner context' {

    It 'Mocks apply to child scopes' {
        # Inherits the mock from the Describe block
        Get-DataStore -Name RandomName | Should -Be 'Mocked'
    }

}

# Example 11b:
Context 'Another inner context' {

    BeforeAll {
        Mock Get-DataStore { 'Re-mocked again' }
    }

    It 'Unless a more local mock takes precedence' {
        # Inherits the overridden mock from the Context block
        $Result = Get-DataStore -Name RandomName
        $Result | Should -Not -Be 'Mocked'
        $Result | Should -Not -Be 'Re-mocked'
        $Result | Should -Be 'Re-mocked again'
    }

}
