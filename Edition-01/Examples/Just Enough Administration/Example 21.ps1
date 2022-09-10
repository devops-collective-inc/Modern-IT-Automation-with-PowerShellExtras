$PSSessionCapabilityParams = @{
    ConfigurationName = 'JEAMaintenance'
    Username = 'CONTOSO\HelpdeskUser01'
}

Get-PSSessionCapability @PSSessionCapabilityParams
