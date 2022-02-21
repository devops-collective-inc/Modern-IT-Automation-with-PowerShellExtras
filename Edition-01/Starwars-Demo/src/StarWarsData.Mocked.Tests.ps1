# Arrange
BeforeAll {
    . $PSCommandPath.Replace('.Mocked.Tests.ps1','.ps1')

    Mock Invoke-StarWarsApi {  
        $output1 = [PSCustomObject]@{
            id     = 4
            name   = 'Darth Vader'
            gender = 'male'
            height = '202'
            weight = '136'
        }
        $output2 = [PSCustomObject]@{
            id     = 1
            name   = 'Luke Skywalker'
            gender = 'male'
            height = '172'
            weight = '77'
        }
        $output3 = [PSCustomObject]@{
            id     = 9
            name   = 'Anakin Skywalker'
            gender = 'male'
            height = '188'
            weight = '84'
        }
        Write-Output @($output1, $output2, $output3)
    } -Verifiable -ParameterFilter { $objectType -eq 'People'} 

    Mock Invoke-StarWarsApi {  
        $output = [PSCustomObject]@{
            height     = '172'
            mass       = '77'
            hair_color = 'blonde'
            skin_color = 'fair'
            eye_color  = 'blue'
            birth_year = '199BBY'
            gender     = 'male'
            name       = 'Luke Skywalker'
            homeworld  = 1
            id         = 1
        }
        Write-Output @($output)
    } -Verifiable -ParameterFilter { $objectType -eq 'People' -and $id -eq 1} 

    Mock Invoke-StarWarsApi {  
        $output = [PSCustomObject]@{
            height     = '202'
            mass       = '136'
            hair_color = 'none'
            skin_color = 'white'
            eye_color  = 'yellow'
            birth_year = '41.9BBY'
            gender     = 'male'
            name       = 'Darth Vader'
            homeworld  = 1
            id         = 4
        }
        Write-Output @($output)
    } -Verifiable -ParameterFilter { $objectType -eq 'People' -and $id -eq 4} 

    Mock Invoke-StarWarsApi {  
        $output = [PSCustomObject]@{
            height     = '188'
            mass       = '84'
            hair_color = 'blonde'
            skin_color = 'fair'
            eye_color  = 'blue'
            birth_year = '41.9BBY'
            gender     = 'male'
            name       = 'Anakin Skywalker'
            homeworld  = 1
            id         = 9
        }
        Write-Output @($output)
    } -Verifiable -ParameterFilter { $objectType -eq 'People' -and $id -eq 9} 

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

    Mock Invoke-StarWarsApi {  
        $output = [PSCustomObject]@{
            diameter        = '12120'
            rotation_period = '26'
            orbital_period  = '312'
            gravity         = '1 standard'
            population      = '4500000000'
            climate         = 'temperate'
            terrain         = 'grassy hills, swamps, forests, mountains'
            name            = 'Naboo'
            id              = 8
        }
        Write-Output @($output)
    } -Verifiable -ParameterFilter { $objectType -eq 'Planets' -and $id -eq 8} 

    Mock Invoke-StarWarsApi {  
        $output = [PSCustomObject]@{
            diameter        = '10465'
            rotation_period = '23'
            orbital_period  = '304'
            gravity         = '1 standard'
            population      = '200000'
            climate         = 'arid'
            terrain         = 'desert'
            name            = 'Tatooine'
            id              = 1
        }
        Write-Output @($output)
    } -Verifiable -ParameterFilter { $objectType -eq 'Planets' -and $id -eq 1} 

    Mock Invoke-StarWarsApi {  
        $output = [PSCustomObject]@{
            diameter        = '9830'
            rotation_period = '25'
            orbital_period  = '378'
            gravity         = '1 standard'
            population      = '1000'
            climate         = 'temperate'
            terrain         = 'oceans, savannas, mountains, grasslands'
            name            = 'Dantooine'
            id              = 25
        }
        Write-Output @($output)
    } -Verifiable -ParameterFilter { $objectType -eq 'Planets' -and $id -eq 25} 
}

Describe 'Search-SWPerson' -Tag 'Unit', 'Mocked' {
    It 'Returns a single match' {
        # Arrange
        $testName = 'Vader'
        
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
        $result.Error | Should -Be "No person results found for '$testName'."
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
        $result.Error | Should -Be "No planet results found for '$testName'."
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