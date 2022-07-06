BeforeAll {
    . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
}

Describe "Set-DataStore unit tests" {

    Context "Correct data" {

        BeforeAll {

            Mock Get-DataStoreFile {
                return (Join-Path 'TestDrive:' "$Name.xml")
            }

            Mock Export-Clixml {
                $RealCmd = Get-Command Export-Clixml -CommandType Cmdlet
                $SafePath = Join-Path TestDrive: (Split-Path $LiteralPath -Leaf)
                & $RealCmd -InputObject $InputObject -LiteralPath $SafePath
            }

            Mock Set-ItemProperty {
                $RealCmd = Get-Command Set-ItemProperty -CommandType Cmdlet
                $SafePath = Join-Path TestDrive: (Split-Path $LiteralPath -Leaf)
                & $RealCmd -LiteralPath $SafePath -Name $Name -Value $Value
            }

            $Rand = "Random", (Get-Random) -join ''
            $ExpectDate = Get-Date -AsUTC
            $ExpectPath = Join-Path 'TestDrive:' "$Rand.xml"
        }

        It "Writes CLIXML to data store file" {
            $ExpectPath | Should -Not -Exist
            Set-DataStore -Name $Rand -Data @{ a = 1 } -Update $ExpectDate
            $ExpectPath | Should -Exist
        }

        It "Writes correct date to data store attributes" {
            $File = Get-Item -LiteralPath $ExpectPath
            $File.LastWriteTimeUtc | Should -be $ExpectDate
        }
        
        It "Stores PSCustomObject with property a = 1" {
            [xml]$Data = Get-Content -LiteralPath $ExpectPath
            $Types = $Data.Objs.Obj.TN.ChildNodes
            $Types.Count | Should -Be 2
            $Types[0].'#text' |
                Should -Be 'System.Management.Automation.PSCustomObject'
            $Values = $Data.Objs.Obj.MS.ChildNodes
            $Values.Count | Should -Be 1
            $Values[0].Name | Should -Be 'I32'
            $Values[0].N | Should -Be 'a'
            $Values[0].'#text' | Should -Be '1'
        }

    }

}
