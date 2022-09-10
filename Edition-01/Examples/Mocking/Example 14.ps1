BeforeDiscovery {
    $GetModuleParams = @{
        Name        = 'DataStoreFunctions'
        ErrorAction = 'SilentlyContinue'
    }
    Get-Module @GetModuleParams | Remove-Module
    New-Module -Name DataStoreFunctions -ScriptBlock {
        # Load functions
        . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
        # Export public functions
        $Exports = @{
            Function = @(
                'New-DataStore',
                'Remove-DataStore',
                'Get-DataStore',
                'Get-DataStoreDate',
                'Set-DataStore',
                'Set-DataStoreDate',
                'Update-DataStore'
            )
        }
        Export-ModuleMember @Exports
    } | Import-Module -Force
}
