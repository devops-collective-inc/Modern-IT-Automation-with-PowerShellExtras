Describe 'Should -Invoke tests' {
    # Same mock as Example 3

    It 'Calls Get-DataStore five times' {
        for ($i = 0; $i -lt 5; $i++) {
            Get-DataStore -Name 'SomeName'
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

}
