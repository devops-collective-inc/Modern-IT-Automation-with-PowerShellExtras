Configuration JEAMaintenance
{
    Import-DscResource -Module JeaDsc

    # Apply the session configuration to only the machines
    # that have PSRemoting Enabled
    Node $AllNodes.Where{$_.PSRemotingEnabled}.NodeName {

        # Define the first resource
        JeaRoleCapabilities ServiceMaintenanceCapability {

            Path =  "C:\Program Files\WindowsPowerShell\Modules\" +
                    "Demo\RoleCapabilities\ServiceMaintenance.psrc"
            VisibleCmdlets = "Restart-Service", "Get-Service"
            Description = "This role enables users to get/restart any service"
            # Author/ComanyName/GUID/Copyright are not supported.

        }

        # Define the second resource
        JeaRoleCapabilities ProcessMaintenanceCapability {

            Path =  "C:\Program Files\WindowsPowerShell\Modules\" +
                    "Demo\RoleCapabilities\ProcessMaintenance.psrc"
            VisibleCmdlets = "Get-Process", "Stop-Process"
            Description = "This role enables users to stop/start processes"
            # Author/ComanyName/GUID/Copyright are not supported.

        }

        JeaSessionConfiguration HelpDeskManagmenetEndpoint
        {
            Name                = 'JEAMaintenance'
            RunAsVirtualAccount = $true
            Ensure              = 'Present'
            DependsOn           =
            '[JeaRoleCapabilities]ServiceMaintenanceCapability',
            '[JeaRoleCapabilities]ProcessMaintenanceCapability'
            RoleDefinitions     = "@{
            'Contoso\ServiceMaintenanceCapability' = @{ RoleCapabilities =
                                                'ServiceMaintenanceCapability'}
            'Contoso\ProcessMaintenanceCapability' = @{ RoleCapabilities =
                                                'ProcessMaintenanceCapability'}
            }
            "
            TranscriptDirectory = 'C:\Temp\Transcripts'
        }

    }

}
