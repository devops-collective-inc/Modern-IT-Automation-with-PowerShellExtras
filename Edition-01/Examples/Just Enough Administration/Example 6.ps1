# ServerConfigurationData.psd1
@{

    AllNodes = @(
        @{
            NodeName = "DC01"
            Role = "DomainController"
            PSRemotingEnabled = $true
            PSRemotingConfigurationType = @(
                "HelpdeskResetPassword",
                "DNSManagement"
            )
        },
        @{
            NodeName = "FS01"
            Role = "FileSrver"
            PSRemotingEnabled = $false
        },
        @{
            NodeName = "HRBW"
            Role = "HybridRunbookWorker"
            PSRemotingEnabled = $true
            PSRemotingConfigurationType = "NoRestrictions"
        }
    )
}
