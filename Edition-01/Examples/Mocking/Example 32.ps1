# Same Context block as Example 31
It 'Calls Set-ItemProperty with correct path, name, and value once' {
    Should -Invoke Set-ItemProperty -Exactly 1 -ExclusiveFilter {
        $LiteralPath -eq $ExpectPath -and
        $Name -eq 'LastWriteTimeUtc' -and
        $Value -eq $ExpectDate
    } -Scope Context
}
