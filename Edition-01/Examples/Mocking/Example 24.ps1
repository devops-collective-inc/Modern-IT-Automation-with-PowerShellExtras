# Same Describe/BeforeAll block as Example 22
Mock Invoke-RestMethod {
    $null = $Uri -match '/data/(\d+)$'
    [int64]$Date = $Matches[1]

    @{
        class = 'data'
        date  = $Date
        name  = "Update $Date"
        data  = @{ Property1 = 'Value 1'; Property2 = 'Value 2' }
    }
} -ParameterFilter { $Uri -match '/data/\d+$' } -Verifiable
