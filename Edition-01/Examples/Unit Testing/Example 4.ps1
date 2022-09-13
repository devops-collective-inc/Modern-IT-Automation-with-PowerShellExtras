BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Invoke-Addition' {

    It 'Correctly adds the numbers passed' {
        # Arrange
        $TestNums = @(1, 2, 3, 4, 5)

        # Act
        $Sum = Invoke-Addition -Numbers $TestNums

        #Assert
        $Sum | Should -Be 15
    }

}
