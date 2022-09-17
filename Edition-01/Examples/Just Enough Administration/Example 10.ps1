    JeaSessionConfiguration HelpDeskManagmenetEndpoint
    {
        Name                = 'JEAMaintenance'
        RunAsVirtualAccount = $true
        Ensure              = 'Present'
        DependsOn           =
        '[JeaRoleCapabilities]ServiceMaintenance',
        '[JeaRoleCapabilities]ProcessMaintenance'
        # We define the role capabilities by specifying the
        # role capability Active Directory group:
        RoleDefinitions     = "
            @{
            'Contoso\PSHRemoting-APP1-ServiceMaintenance' = @{
                RoleCapabilities = 'ServiceMaintenance'}
            'Contoso\PSHRemoting-APP1-ProcessMaintenance' = @{
                RoleCapabilities = 'ProcessMaintenance'}
            }
        "
    }
