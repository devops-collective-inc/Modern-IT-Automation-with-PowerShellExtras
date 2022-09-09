# Same Describe/Context block as Example 28
It 'Calls Get-DataStore three times' {
    Should -Invoke Get-DataStore -Exactly 3 -Scope Describe
}
It 'Calls Set-DataStore once' {
    Should -Invoke Set-DataStore -Exactly 1 -Scope Describe
}
