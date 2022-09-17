InModuleScope DataStoreFunctions {

    Describe 'Running tests directly in the module scope' {

        It 'Running the entire test in the module scope' {
            Mock Get-DataStoreFile {
                Get-Item 'TestDrive:\DummyDataStore.xml'
            }
            $Store = Get-DataStore -Name SomeName
            $Store.Name | Should -Be 'SomeName'
            $Store.Data | Should -BeNullOrEmpty
        }

    }

}
