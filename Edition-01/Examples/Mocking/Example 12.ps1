# Same Describe block as Example 10
Context 'BeforeEach and BeforeAll execution order' {

    BeforeEach {
        if ($Alt) {
            Mock Get-DataStore { 'BeforeEach Mock' }
        }
    }
    BeforeAll {
        Mock Get-DataStore { 'BeforeAll Mock' }
    }

    It 'Test <Test> should use the Before<Mock> Mock' -TestCases @(
        @{ Test = 1; Alt = $false; Mock = 'All' }
        @{ Test = 2; Alt = $true; Mock = 'Each' }
        @{ Test = 3; Alt = $false; Mock = 'All' }
    ) {
        Get-DataStore -Name RandomName | Should -Be "Before$Mock Mock"
    }

}
