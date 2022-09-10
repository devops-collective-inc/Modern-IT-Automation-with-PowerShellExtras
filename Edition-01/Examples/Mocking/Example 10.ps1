Describe 'Mock scoping tests' {

    # Example 10a:
    It 'BeforeAll sets up mocks before all tests' {
        Get-DataStore -Name RandomName | Should -Be 'Mocked'
    }

    BeforeAll {
        # Applies to whole Describe
        Mock Get-DataStore { 'Mocked' }
    }

    # Example 10b:
    It 'BeforeAll applies mock to entire parent block' {
        Get-DataStore -Name RandomName | Should -Be 'Mocked'
    }

    # Example 10c:
    It 'Mocks applied inside It take precedence' {
        # Override with local mock
        Mock Get-DataStore { 'Re-mocked' }
        $Result = Get-DataStore -Name RandomName
        $Result | Should -Not -Be 'Mocked'
        $Result | Should -Be 'Re-mocked'
    }

}
