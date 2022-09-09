# Same Describe block as Example 5
Context 'Scope tests' {

    # Example 6a:
    It 'Calls Get-DataStore exactly once in the It block' {
        Get-DataStore -Name 'SomeOtherName'
        Should -Invoke 'Get-DataStore' -Exactly 1 -Scope It
        # Same as above since It is the 0th parent (this block)
        Should -Invoke 'Get-DataStore' -Exactly 1 -Scope 0
    }

    Context 'An inner scope' {

        # Example 6b:
        It 'Calls Get-DataStore once in the current Context block' {
            Get-DataStore -Name 'SomeOtherName'
            Should -Invoke 'Get-DataStore' -Exactly 1 -Scope Context
            # Same as above since Context is the 1st parent
            Should -Invoke 'Get-DataStore' -Exactly 1 -Scope 1
        }

        # Example 6c:
        It 'Fails to target outer Context block' {
            # THIS TEST FAILS since the innermost Context block is selected
            Should -Invoke 'Get-DataStore' -Exactly 2 -Scope Context
        }
        It 'Calls Get-DataStore twice in outer Context block' {
            # The 2nd parent of this It block is the outer Context block
            Should -Invoke 'Get-DataStore' -Exactly 2 -Scope 2
        }
        It 'Calls Get-DataStore seven times in outer Describe block' {
            Should -Invoke 'Get-DataStore' -Exactly 7 -Scope Describe
            # The 3rd parent of this It block is the Describe block
            Should -Invoke 'Get-DataStore' -Exactly 7 -Scope 3
        }

    }

}
