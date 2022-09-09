$Params = @{
    Path = ${Env:ProgramFiles(x86)}
    ChildPath = 'Windows Kits\10\bin\10.0.22000.0\x64\signtool.exe'
}
$SignToolPath = Join-Path @$Params
& $SignToolPath verify /pa C:\test.ps1
