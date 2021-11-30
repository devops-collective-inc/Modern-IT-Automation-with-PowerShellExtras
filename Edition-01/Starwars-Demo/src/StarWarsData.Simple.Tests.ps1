# Arrange
BeforeAll {
    . $PSCommandPath.Replace('.Simple.Tests.ps1','.ps1')
}

Describe 'Search-SWPerson' -Tag 'Unit' {
    It 'Returns a single match' {
        # Arrange
        $testName = 'Bail'

        # Act
        $result = Search-SWPerson -Name $testName

        # Assert
        $result.Count | Should -Be 1
        $result.name | Should -BeLike "*$testName*"
    }
    It 'Returns no matches' {
        # Arrange
        $testName = 'Invalid'

        # Act
        $result = Search-SWPerson -Name $testName

        # Assert
        $result | Should -BeNullOrEmpty
    }
    It 'Returns multiple matches' {
        # Arrange
        $testName = 'walker'

        # Act
        $result = Search-SWPerson -Name $testName

        # Assert
        $result.Count | Should -BeGreaterThan 1
        $result.Name -like "*$testName*" | Should -HaveCount $result.Count
    }
}

Describe 'Search-SWPlanet' -Tag 'Unit' {
    It 'Returns a single match' {
        # Arrange
        $testName = 'nabo'

        # Act
        $result = Search-SWPlanet -Name $testName

        # Assert
        $result.Count | Should -Be 1
        $result.name | Should -BeLike "*$testName*"
    }
    It 'Returns no matches' {
        # Arrange
        $testName = 'Invalid'

        # Act
        $result = Search-SWPlanet -Name $testName

        # Assert
        $result | Should -BeNullOrEmpty
    }
    It 'Returns multiple matches' {
        # Arrange
        $testName = 'too'

        # Act
        $result = Search-SWPlanet -Name $testName

        # Assert
        $result.Count | Should -BeGreaterThan 1
        $result.Name -like "*$testName*" | Should -HaveCount $result.Count
    }
}