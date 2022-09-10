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
