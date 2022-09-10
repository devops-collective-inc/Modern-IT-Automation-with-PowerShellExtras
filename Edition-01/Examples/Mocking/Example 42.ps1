# Same Describe block as Example 40
It 'Lists mock archive' {
    tar -tf test.zip | Should -Be $MockFile
}

It 'Extracts mock file' {
    tar -xvf test.zip | Should -Be "x $MockFile"
    $File = Join-Path 'TestDrive:' $MockFile
    $File | Should -Exist
    $File | Should -FileContentMatch 'Oh no, not again'
}

It 'Only calls tar in list or extract mode' {
    Should -Invoke tar -Exactly 2 -ExclusiveFilter {
        ($args -like '-t*').Count -gt 0 -or
        ($args -like '-x*').Count -gt 0
    } -Scope Describe
}
