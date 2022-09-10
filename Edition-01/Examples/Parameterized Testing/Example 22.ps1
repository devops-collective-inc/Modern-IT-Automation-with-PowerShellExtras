$InvokePesterParams = @{
    Script = @{
        Path = 'D:\PowerShellDate\Tests\Get-PSVersionTable.Tests.ps1'
        Parameters = @{
            Importpath = 'D:\PowerShellDate\Tests\Import\PSVersiontable5.1.xml'
        }
    }
    Outputfile = 'test.xml'
    Outputformat = 'NUnitXml'
    PassThru = $true
}
$ResultPester = Invoke-pester @InvokePesterParams

Test-Path .\test.xml
