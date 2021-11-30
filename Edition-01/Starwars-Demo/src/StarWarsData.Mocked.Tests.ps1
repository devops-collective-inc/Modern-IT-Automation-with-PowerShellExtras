# Arrange
BeforeAll {
    . $PSCommandPath.Replace('.Mocked.Tests.ps1','.ps1')

    Mock Invoke-StarWarsApi {  
        $output1 = [PSCustomObject]@{
            id     = 68
            name   = 'Bail Prestor Organa'
            gender = 'male'
            height = '191'
            weight = 'unknown'
        }
        $output2 = [PSCustomObject]@{
            id     = 2
            name   = 'Luke Skywalker'
            gender = 'male'
            height = '172'
            weight = '77'
        }
        $output3 = [PSCustomObject]@{
            id     = 2
            name   = 'Anakin Skywalker'
            gender = 'male'
            height = '188'
            weight = '84'
        }
        Write-Output @($output1, $output2, $output3)
    } -Verifiable -ParameterFilter { $objectType -eq 'People'} 

    Mock Invoke-StarWarsApi {  
        $output1 = [PSCustomObject]@{
            id         = 8
            name       = 'Naboo'
            population = 4500000000
            diameter   = 12120
            terrain    = @('grassy hills', 'swamps', 'forests', 'mountains')
        }
        $output2 = [PSCustomObject]@{
            id         = 1
            name       = 'Tatooine'
            population = 200000
            diameter   = 10465
            terrain    = @('desert')
        }
        $output3 = [PSCustomObject]@{
            id         = 25
            name       = 'Dantooine'
            population = 1000
            diameter   = 9830
            terrain    = @('oceans', 'savannas', 'mountains', 'grasslands')
        }
        Write-Output @($output1, $output2, $output3)
    } -Verifiable -ParameterFilter { $objectType -eq 'Planets'} 
}

Describe 'Search-SWPerson' -Tag 'Unit', 'Mocked' {
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
    It "Returns multiple matches" {
        # Arrange
        $testName = 'walker'

        # Act
        $result = Search-SWPerson -Name $testName

        # Assert
        $result.Count | Should -BeGreaterThan 1
        $result.Name -like "*$testName*"| Should -HaveCount $result.Count
    }
}

Describe 'Search-SWPlanet' -Tag 'Unit', 'Mocked' {
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
        # Arange
        $testName = 'too'

        # Act
        $result = Search-SWPlanet -Name $testName

        # Assert
        $result.Count | Should -BeGreaterThan 1
        $result.Name -like "*$testName*" | Should -HaveCount $result.Count
    }
}