BeforeAll {
    . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
}

Describe "Mock scoping tests" {

    # Example 10a:
    It "BeforeAll sets up mocks before all tests" {
        Get-DataStore -Name RandomName | Should -Be 'Mocked'
    }

    BeforeAll {
        # Applies to whole Describe
        Mock Get-DataStore { 'Mocked' }
    }

    # Example 10b:
    It "BeforeAll applies mock to entire parent block" {
        Get-DataStore -Name RandomName | Should -Be 'Mocked'
    }

    # Example 10c:
    It "Mocks applied inside It take precedence" {
        # Override with local mock
        Mock Get-DataStore { 'Re-mocked' }
        $Result = Get-DataStore -Name RandomName
        $Result | Should -Not -Be "Mocked"
        $Result | Should -Be 'Re-mocked'
    }

    # Example 11a:
    Context 'Inner context' {

        It "Mocks apply to child scopes" {
            # Inherits the mock from the Describe block
            Get-DataStore -Name RandomName | Should -Be 'Mocked'
        }

    }

    # Example 11b:
    Context 'Another inner context' {

        BeforeAll {
            Mock Get-DataStore { 'Re-mocked again' }
        }

        It "Unless a more local mock takes precedence" {
            # Inherits the overridden mock from the Context block
            $Result = Get-DataStore -Name RandomName
            $Result | Should -Not -Be 'Mocked'
            $Result | Should -Not -Be 'Re-mocked'
            $Result | Should -Be 'Re-mocked again'
        }

    }

    Context 'BeforeEach and BeforeAll execution order' {

        BeforeEach {
            if ($Alt) {
                Mock Get-DataStore { 'BeforeEach Mock' }
            }
        }
        BeforeAll {
            Mock Get-DataStore { 'BeforeAll Mock' }
        }

        It "Test <Test> should use the Before<Mock> Mock" -TestCases @(
            @{ Test = 1; Alt = $false; Mock = 'All' }
            @{ Test = 2; Alt = $true; Mock = 'Each' }
            @{ Test = 3; Alt = $false; Mock = 'All' }
        ) {
            Get-DataStore -Name RandomName | Should -Be "Before$Mock Mock"
        }

    }

}
