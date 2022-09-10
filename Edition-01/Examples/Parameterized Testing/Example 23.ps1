BeforeDiscovery {
    $AllServices = Get-Service
    $HList = [System.Collections.Generic.List[hashtable]]::new()
    $AllServices.ForEach{
        $HList.add(@{ Name = $_.name })
    }
}

BeforeAll {
    $AllServices = Get-Service
}

Describe 'Services' {
    It '<Name> Should be Running' -ForEach $HList {
        $AllServices.Where{ $_.name -match $name }.Status |
            Should -Match 'Running'
    }
}
