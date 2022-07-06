BeforeAll {
    . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
}

Describe "Data store test" {

    BeforeAll {
        # Mock must be placed in a BeforeAll/BeforeEach block
        # unless it's directly inside an It block
        Mock Get-DataStore {
            [pscustomobject]@{
                Name   = $Name # Copy name from $Name parameter
                Update = (Get-Date).AddDays(-1) # Yesterday
                Data   = [pscustomobject]@{} # Empty store data
            }
        }
    }

    It "Returns valid fake store object for '<RandomName>'" -TestCases @(
        @{ RandomName = '1234' }
        @{ RandomName = 'AnotherRandomName' }
    ) {
        $Store = Get-DataStore -Name $RandomName
        $Store.Name | Should -BeExactly $RandomName
        $Store.Update.DayOfYear | Should -Be ((Get-Date).DayOfYear - 1)
        $Store.Data | Should -BeOfType [pscustomobject]
        $Store.Data.PSObject.Properties | Should -BeNullOrEmpty
    }

}

# If placed in a `BeforeEach` block, the mock is scoped to each `It` block in the current `Context` or `Describe` block.
# If placed in a `BeforeAll` block, the mock is scope to the whole current `Context` or `Describe` block.
# If placed in an `It` block, the mock is scoped to just that `It` block.

# BeforeEach runs in each It scope once, so a mock called in BeforeEach is run once for every It block that it covers.
