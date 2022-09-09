$ContainerParams = @{
    Path = '.\Tests\Get-PSVersionTable.Tests.ps1'
    Data = @{ ImportPath = '.\Import\PSVersiontable-pwsh.xml' }
}
$container = New-PesterContainer @ContainerParams
Invoke-Pester -Container $container -Output Detailed
