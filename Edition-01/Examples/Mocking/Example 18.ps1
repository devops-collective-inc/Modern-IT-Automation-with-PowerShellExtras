# Same Describe block as Example 15
It 'Returns the dummy data when private function mocked' {
    Mock Get-DataStoreFile {
        Get-Item 'TestDrive:\DummyDataStore.xml'
    } -ModuleName DataStoreFunctions
    $Store = Get-DataStore -Name SomeName
    $Store.Name | Should -Be 'SomeName'
    $Store.Data | Should -BeNullOrEmpty
}
