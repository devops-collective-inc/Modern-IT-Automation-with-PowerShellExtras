# Same Describe block as Example 15
It 'Alternative method for mocking module functions' {
    InModuleScope DataStoreFunctions {
        Mock Get-DataStoreFile {
            Get-Item 'TestDrive:\DummyDataStore.xml'
        }
    }
    $Store = Get-DataStore -Name SomeName
    $Store.Name | Should -Be 'SomeName'
    $Store.Data | Should -BeNullOrEmpty
}
