Describe 'Invoke-Addition' -Tag 'Unit' {

    It 'Returns a result of <Sum> given <Desc> (<Values>)' -TestCases @(
        @{ Desc = 'numbers 1 to 5'; Values = @(1, 2, 3, 4, 5); Sum = 15 }
        @{ Desc = 'negative numbers'; Values = @(-2, -4, -9); Sum = -15 }
        @{ Desc = 'only two numbers'; Values = @(10, 5); Sum = 15 }
        @{ Desc = 'only one number'; Values = @(64); Sum = 64 }
    ) {
        # Act
        $Result = Invoke-Addition -Numbers $Values

        # Assert
        $Result | Should -Not -BeNullOrEmpty
        $Result | Should -Be $Sum
    }

}
