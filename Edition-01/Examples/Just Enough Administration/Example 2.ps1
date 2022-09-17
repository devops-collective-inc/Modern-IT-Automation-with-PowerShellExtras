    $roleParameters = @{
        Path = ".\ServiceMaintenance.psrc"
        Author = "User01"
        CompanyName = "Fabrikam Corporation"
        Description = "This role enables users to get/restart any service"
        VisibleCmdlets = "Restart-Service", "Get-Service"
    }
    New-PSRoleCapabilityFile @roleParameters

    $roleParameters = @{
        Path = ".\ProcessMaintenance.psrc"
        Author = "User01"
        CompanyName = "Fabrikam Corporation"
        Description = "This role enables users to stop/start processes"
        VisibleCmdlets = "Get-Process", "Stop-Process"
    }
    New-PSRoleCapabilityFile @roleParameters
