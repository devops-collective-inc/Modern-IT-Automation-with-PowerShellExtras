# Same Describe/BeforeAll block as Example 22
$DummyName = 'RandomName', (Get-Random) -join '_'
$DummyStore = [pscustomobject]@{
    Name   = 'Not Set'
    Update = [datetime]::MinValue
    Data   = [pscustomobject]@{}
}

Mock Get-DataStore { $DummyStore } -Verifiable

Mock Set-DataStore {
    $DummyStore.Name = $Name
    $DummyStore.Update = $Update
    $DummyStore.Data = [pscustomobject]$Data
} -Verifiable
