BeforeAll {
    $DummyXMLParams = @{
        Path        = 'TestDrive:\DummyDataStore.xml'
        InputObject = [pscustomobject]@{}
    }
    Export-Clixml @DummyXMLParams
}
