Describe 'Update-DataStore Tests' {

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

    }

}
