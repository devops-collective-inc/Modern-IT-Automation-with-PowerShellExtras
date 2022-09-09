# Same Describe block as Example 3
It "Returns valid fake store object for '<RandomName>'" -TestCases @(
    @{ RandomName = '1234' }
    @{ RandomName = 'AnotherRandomName' }
) {
    $Store = Get-DataStore -Name $RandomName
    $Store.Name | Should -BeExactly $RandomName
    $Store.Update.DayOfYear | Should -Be ((Get-Date).DayOfYear - 1)
    $Store.Data | Should -BeOfType [pscustomobject]
    $Store.Data.PSObject.Properties | Should -BeNullOrEmpty
}
