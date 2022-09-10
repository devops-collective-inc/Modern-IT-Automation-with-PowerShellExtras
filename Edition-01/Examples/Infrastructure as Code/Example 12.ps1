for ($i = 1; $i -lt $VMInstances + 1; $i++) {

    $Instance = '{0:d3}' -f $i

    ## Publish the configuration script to user storage
    $DSCConfigurationParams = @{
        ConfigurationPath  = "$PSScriptRoot\Deploy-WebServer.ps1"
        ResourceGroupName  = $RGName
        StorageAccountName = $StorageAccountName
        Force              = $true
    }

    Publish-AzVMDscConfiguration @DSCConfigurationParams

    ## Set the VM to run the DSC configuration
    $DSCExtensionParams = @{
        Version                   = '2.76'
        ResourceGroupName         = $RGName
        VMName                    = "$VmBaseName$Instance"
        ArchiveStorageAccountName = $StorageAccountName
        ArchiveBlobName           = 'Deploy-WebServer.ps1.zip'
        AutoUpdate                = $true
        ConfigurationName         = 'Configure-IISServer'
        ConfigurationArgument     = @{
            ConnectionString = $ConnectionString
        }
    }

    Set-AzVMDscExtension @DSCExtensionParams

}
