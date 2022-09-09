$ContainerParams = @{
    Path = '.\Tests\Get-PSVersionTable.Tests.ps1'
    Data = @{ ImportPath = '.\Import\PSVersiontable5.1.xml' }
}
$container = New-PesterContainer @ContainerParams
Invoke-Pester -Container $container -Output Detailed
