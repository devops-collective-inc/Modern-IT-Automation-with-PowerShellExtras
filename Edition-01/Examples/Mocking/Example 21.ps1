# Same Describe block as Example 15
It 'Mock assertions should work in the correct scope' {
    Mock Get-DataStoreFile {} -ModuleName DataStoreFunctions -Verifiable
    Get-DataStore -Name SomeName

    Should -Invoke Get-DataStoreFile -ModuleName DataStoreFunctions -Exactly 1

    InModuleScope DataStoreFunctions {
        Should -Invoke Get-DataStoreFile -Exactly 1
    }

    Should -InvokeVerifiable
}
