BeforeDiscovery {
    Get-Module -Name DataStoreFunctions -ea:si | Remove-Module
    New-Module -Name DataStoreFunctions -ScriptBlock {
        # Load functions
        . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
        # Export public functions
        $Exports = @{
            Function = @(
                'New-DataStore',
                'Remove-DataStore',
                'Get-DataStore',
                'Set-DataStore',
                'Update-DataStore'
            )
        }
        Export-ModuleMember @Exports
    } | Import-Module -Force
}

BeforeAll {
    $DummyXMLParams = @{
        Path        = 'TestDrive:\DummyDataStore.xml'
        InputObject = [pscustomobject]@{}
    }
    Export-Clixml @DummyXMLParams
}

Describe 'Mocking in modules' {

    It 'Throws an error because real private function called' {
        { Get-DataStore -Name SomeName } | Should -Throw
    }

    It "Can't mock a private function in the test scope" {
        Mock Get-DataStoreFile {}
    }

    It 'Returns the dummy data when private function mocked' {
        Mock Get-DataStoreFile {
            Get-Item 'TestDrive:\DummyDataStore.xml'
        } -ModuleName DataStoreFunctions
        $Store = Get-DataStore -Name SomeName
        $Store.Name | Should -Be 'SomeName'
        $Store.Data | Should -BeNullOrEmpty
    }

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

    It 'Mock assertions should work in the correct scope' {
        Mock Get-DataStoreFile {} -ModuleName DataStoreFunctions -Verifiable
        Get-DataStore -Name SomeName
    
        Should -Invoke Get-DataStoreFile -ModuleName DataStoreFunctions -Exactly 1
    
        InModuleScope DataStoreFunctions {
            Should -Invoke Get-DataStoreFile -Exactly 1
        }
    
        Should -InvokeVerifiable
    }

}

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
