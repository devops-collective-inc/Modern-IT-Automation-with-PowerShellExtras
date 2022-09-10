Describe 'Data store test' {

    BeforeAll {
        # Mock must be placed in a BeforeAll/BeforeEach block
        # unless it's directly inside an It block
        Mock Get-DataStore {
            [pscustomobject]@{
                Name   = $Name # Copy name from $Name parameter
                Update = (Get-Date).AddDays(-1) # Yesterday
                Data   = [pscustomobject]@{} # Empty store data
            }
        }
    }

}
