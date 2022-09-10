Describe 'Set-DataStore unit tests' {

    Context 'Correct data' {

        BeforeAll {

            Mock Get-DataStoreFile {
                return (Join-Path 'TestDrive:' "$Name.xml")
            }

            Mock Export-Clixml {
                $RealCmd = Get-Command Export-Clixml -CommandType Cmdlet
                $Filename = Split-Path $LiteralPath -Leaf
                $SafePath = Join-Path 'TestDrive:' $Filename
                & $RealCmd -InputObject $InputObject -LiteralPath $SafePath
            }

            Mock Set-ItemProperty {
                $RealCmd = Get-Command Set-ItemProperty -CommandType Cmdlet
                $Filename = Split-Path $LiteralPath -Leaf
                $SafePath = Join-Path 'TestDrive:' $Filename
                & $RealCmd -LiteralPath $SafePath -Name $Name -Value $Value
            }

            $Rand = 'Random', (Get-Random) -join ''
            $ExpectDate = Get-Date -AsUTC
            $ExpectPath = Join-Path 'TestDrive:' "$Rand.xml"
        }

        It 'Writes CLIXML to data store file' {
            $ExpectPath | Should -Not -Exist
            Set-DataStore -Name $Rand -Data @{ a = 1 } -Update $ExpectDate
            $ExpectPath | Should -Exist
        }

    }

}
