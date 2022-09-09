# Same Context block as Example 33
It 'Writes correct date to data store attributes' {
    $File = Get-Item -LiteralPath $ExpectPath
    $File.LastWriteTimeUtc | Should -Be $ExpectDate
}

It 'Stores PSCustomObject with property a = 1' {
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
