BeforeAll {
    . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')

}

Describe "Should -Invoke tests" {

    BeforeAll {
        # Mock must be placed in a BeforeAll/BeforeEach block
        # unless it's directly inside an It block
        Mock Get-DataStore {
            [pscustomobject]@{
                Name   = $Name # Copy name from $Name parameter
                Update = (Get-Date).AddDays(-1) # Yesterday
                Data   = [pscustomobject]@{} # Empty store data
            }
        } -Verifiable
    }

    It "Calls Get-DataStore five times" {
        for ($i = 0; $i -lt 5; $i++) {
            Get-DataStore -Name "SomeName"
        }
        # At least once
        Should -Invoke 'Get-DataStore'

        # At least twice
        Should -Invoke 'Get-DataStore' -Times 2

        # Exactly 5 times
        Should -Invoke 'Get-DataStore' -Exactly 5

        # No more than 5
        Should -Not -Invoke 'Get-DataStore' -Times 6

        # Not exactly 4 times
        Should -Not -Invoke 'Get-DataStore' -Exactly 4
    }

    Context "Scope tests" {

        # Example 6a:
        It "Calls Get-DataStore exactly once in the It block" {
            Get-DataStore -Name "SomeOtherName"
            Should -Invoke 'Get-DataStore' -Exactly 1 -Scope It
            # Same as above since It is the 0th parent (this block)
            Should -Invoke 'Get-DataStore' -Exactly 1 -Scope 0
        }

        Context "An inner scope" {

            # Example 6b:
            It "Calls Get-DataStore once in the current Context block" {
                Get-DataStore -Name "SomeOtherName"
                Should -Invoke 'Get-DataStore' -Exactly 1 -Scope Context
                # Same as above since Context is the 1st parent
                Should -Invoke 'Get-DataStore' -Exactly 1 -Scope 1
            }

            # Example 6c:
            It "Fails to target outer Context block" {
                # THIS TEST FAILS since the innermost Context block is selected
                Should -Invoke 'Get-DataStore' -Exactly 2 -Scope Context
            }
            It "Calls Get-DataStore twice in outer Context block" {
                # The 2nd parent of this It block is the outer Context block
                Should -Invoke 'Get-DataStore' -Exactly 2 -Scope 2
            }
            It "Calls Get-DataStore seven times in outer Describe block" {
                Should -Invoke 'Get-DataStore' -Exactly 7 -Scope Describe
                # The 3nd parent of this It block is the Describe block
                Should -Invoke 'Get-DataStore' -Exactly 7 -Scope 3
            }

        }

        It "Calls all verifiable mocks at least once" {
            Should -InvokeVerifiable
        }

    }

}
