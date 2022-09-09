Describe 'Set-DataStore tests' {

    Context 'Correct file' {

        BeforeAll {
            Mock Export-Clixml {}
            Mock Set-ItemProperty {}
            Mock Get-DataStoreFile { Join-Path 'TestDrive:' "$Name.xml" }

            $Rand = 'Random', (Get-Random) -join ''
            $ExpectPath = Join-Path 'TestDrive:' "$Rand.xml"
            $ExpectDate = Get-Date -AsUTC
            Set-DataStore -Name $Rand -Data @{} -Update $ExpectDate
        }

        It 'Calls Export-Clixml with correct path once' {
            Should -Invoke Export-Clixml -Exactly 1 -ExclusiveFilter {
                $LiteralPath -eq $ExpectPath
            } -Scope Context
        }

    }

}
