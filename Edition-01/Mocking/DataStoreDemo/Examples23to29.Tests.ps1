BeforeAll {
    . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
}

Describe "Update-DataStore Tests" {

    BeforeAll {

        [int64]$LaterUnix = Get-Random -Minimum 16.1e+11 -Maximum 16.2e+11
        [int64]$EarlierUnix = Get-Random -Minimum 16e+11 -Maximum 16.1e+11

        Mock Invoke-RestMethod {
            @{ class = 'updates'; updates = @(
                    @{ guid = [guid]::Empty; date = $EarlierUnix }
                    @{ guid = [guid]::Empty; date = $LaterUnix }
                )
            }
        } -ParameterFilter { $Uri -like '*/updates' } -Verifiable

        Mock Invoke-RestMethod {
            if ($Uri -match '/data/(\d+)$') {
                [int64]$Date = $Matches[1]
            }
            else {
                throw 'Invalid URI for data store contents'
            }
            @{
                class = 'data'
                date  = $Date
                name  = "Update $Date"
                data  = @{ Property1 = "Value 1"; Property2 = "Value 2" }
            }
        } -ParameterFilter { $Uri -match '/data/\d+$' } -Verifiable

        Mock Invoke-RestMethod {
            throw (
                'Invoke-RestMethod called with unexpected parameters: {0}' -f (
                    $PesterBoundParameters.Keys.ForEach{
                        "$_ = $($PesterBoundParameters.$_)"
                    } -join ', '
                )
            )
        }

        $DummyName = 'RandomName', (Get-Random) -join '_'
        $DummyStore = [pscustomobject]@{
            Name   = 'Not Set'
            Update = [datetime]::MinValue
            Data   = [pscustomobject]@{}
        }

        Mock Get-DataStore { $DummyStore } -Verifiable

        Mock Set-DataStore {
            $DummyStore.Name = $Name
            $DummyStore.Update = $Update
            $DummyStore.Data = [pscustomobject]$Data
        } -Verifiable

    }

    Context "Unit tests" {

        BeforeEach {
            Update-DataStore -Name $DummyName -Source 'https://example.com'
        }

        It "Accesses the right data store" {
            $DummyStore.Name | Should -BeExactly $DummyName
        }
        It "Chooses the latest update" {
            $UnixEpoch = [datetime]::new(1970, 1, 1, 0, 0, 0, 0, 1)
            $Later = $UnixEpoch.AddMilliseconds($LaterUnix)
            $DummyStore.Update | Should -BeExactly $Later
        }
        It "Adds new values to the data store" {
            $DummyStore.Data.Property1 | Should -Be 'Value 1'
            $DummyStore.Data.Property2 | Should -Be 'Value 2'
        }

    }

    Context "Mock tests" {

        It "Accesses data stores and API at least once" {
            Should -InvokeVerifiable
        }
        It "Calls Invoke-RestMethod 4 times overall" {
            Should -Invoke Invoke-RestMethod -Exactly 4 -Scope Describe
        }
        It "Calls Invoke-RestMethod 3 times for update URL" {
            Should -Invoke Invoke-RestMethod -ParameterFilter {
                $Uri -match '.+/updates$'
            } -Exactly 3 -Scope Describe
        }
        It "Calls Invoke-RestMethod once for data URL" {
            Should -Invoke Invoke-RestMethod -ParameterFilter {
                $Uri -match '/data/\d+$'
            } -Exactly 1 -Scope Describe
        }
        It "Calls Get-DataStore three times" {
            Should -Invoke Get-DataStore -Exactly 3 -Scope Describe
        }
        It "Calls Set-DataStore once" {
            Should -Invoke Set-DataStore -Exactly 1 -Scope Describe
        }

    }

}
