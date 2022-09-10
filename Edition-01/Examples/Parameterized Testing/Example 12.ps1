Describe 'Building' {
    It '<building1> does not host <building2.floor3.Apt1>' -ForEach @(
        @{
            Building1 = 'Post'
            Building2 = @{
                Floor1 = 'B2F1'
                Floor2 = 'B2F2'
                Floor3 = @{
                    Apt1 = 'Contoso'
                    Apt2 = 'Fabrikam'
                }
            }
        }
    ) {
        $PSitem | Should -Not -BeNullOrEmpty
    }
}
