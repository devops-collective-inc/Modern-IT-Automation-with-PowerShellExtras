$ResourceGroup = 'MyApp'
$VmName = 'MyVM001'
$StorageName = 'myuniquestorage593x'

## Publish the configuration script to user storage
$DSCConfigurationParams = @{
    ConfigurationPath  = '.\Deploy-WebServer.ps1'
    ResourceGroupName  = $ResourceGroup
    StorageAccountName = $StorageName
    Force              = $true
}

Publish-AzVMDscConfiguration @DSCConfigurationParams

## Set the VM to run the DSC configuration
$DSCExtensionParams = @{
    Version                   = '2.76'
    ResourceGroupName         = $ResourceGroup
    VMName                    = $VmName
    ArchiveStorageAccountName = $StorageName
    ArchiveBlobName           = 'Deploy-WebServer.ps1.zip'
    AutoUpdate                = $true
    ConfigurationName         = 'Configure-IISServer'
}

Set-AzVMDscExtension @DSCExtensionParams
