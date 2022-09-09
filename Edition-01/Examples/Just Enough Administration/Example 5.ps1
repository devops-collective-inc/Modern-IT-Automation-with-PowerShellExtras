[DscLocalConfigurationManager()]
Configuration JeaRoleCapabilities
{
    # This is a partial DSC resource that is used
    # to store the JeaRoleCapabilities.

    Import-DscResource -ModuleName JeaDSC

    Node localhost {

        # Define the first resource
        JeaRoleCapabilities ServiceMaintenanceCapability {

        Path =  "C:\Temp\ServiceMaintenance.psrc"
        VisibleCmdlets = "Restart-Service", "Get-Service"
        Description = "This role enables users to get/restart any service."
        # Author/ComanyName/GUID/Copyright are not supported.

        }

        # Define the second resource
        JeaRoleCapabilities ProcessMaintenanceCapability {

        Path =  "C:\Temp\ProcessMaintenance.psrc"
        VisibleCmdlets = "Get-Process", "Stop-Process"
        Description = "This role enables users to stop/start processes."
        # Author/ComanyName/GUID/Copyright are not supported.

        }

        <#
        # This is an incomplete resource.
        JeaSessionConfiguration AppServerMaintanceEndpoint
        {
            # Before executing this resource, the DSC Resources:
            # ServiceMaintenanceCapability & ProcessMaintenanceCapability need
            # to execute before the creation of the session configuration.
            DependsOn =
            '[JeaRoleCapabilities]ServiceMaintenanceCapability',
            '[JeaRoleCapabilities]ProcessMaintenanceCapability'
        }
        #>

    }
}
