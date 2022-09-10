$Params = @(
    @{
        # User1 should have no access to the server
        ADUserName = 'CONTOSO\User1'
        ExpectedCmdlets = @()
    }
    @{
        # User2 should only have Get-ChildItem
        ADUserName = 'CONTOSO\User2'
        ExpectedCmdlets = @('Get-ChildItem')
    }
    @{
        # User3 should only have Get-Service and Stop-Service
        ADUserName = 'CONTOSO\User3'
        ExpectedCmdlets = @('Get-Service', 'Stop-Service')
    }
)

Describe "Test PowerShell remoting effective access on $ENV:Computer" {

    It "Returns <ExpectedCmdlets> (<ADUserName> on <Computer>)"
                                            -ForEach $Params -Test {

        $params = @{
            ConfigurationName = 'JEAMaintenance'
            UserName = $ADUserName
        }

        $session = Get-PSSessionCapability @params |
                        Where-Object CommandType -eq 'Cmdlet'

        # Test that the commands returns remain correct.
        # No more, no less.

        ($session | Sort-Object -Property Name).Name |
                        Should -Be ($ExpectedCmdlets | Sort-Object)

    }

}
