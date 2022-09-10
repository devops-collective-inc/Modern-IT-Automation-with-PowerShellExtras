# Same Describe block as Example 22
Context 'Unit tests' {

    BeforeEach {
        Update-DataStore -Name $DummyName -Source 'https://example.com'
    }

    It 'Accesses the right data store' {
        $DummyStore.Name | Should -BeExactly $DummyName
    }
    It 'Chooses the latest update' {
        $UnixEpoch = [datetime]::new(1970, 1, 1, 0, 0, 0, 0, 1)
        $Later = $UnixEpoch.AddMilliseconds($LaterUnix)
        $DummyStore.Update | Should -BeExactly $Later
    }
    It 'Adds new values to the data store' {
        $DummyStore.Data.Property1 | Should -Be 'Value 1'
        $DummyStore.Data.Property2 | Should -Be 'Value 2'
    }

}
