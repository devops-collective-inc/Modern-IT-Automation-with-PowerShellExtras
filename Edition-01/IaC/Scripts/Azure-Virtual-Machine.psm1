function New-AzureVirtualMachine {
    param (
        [Parameter(Mandatory = $false)]
        [String]$RGName = 'MyApp',

        [Parameter(Mandatory = $false)]
        [String]$VmBaseName = 'MyVM',

        [Parameter(Mandatory = $false)]
        [int]$VMInstances = 2,

        [Parameter(Mandatory = $false)]
        [String]$LbName = 'MyLb',

        [Parameter(Mandatory = $false)]
        [String]$PoolName = 'BEPool',

        [Parameter(Mandatory = $false)]
        [String]$VnetName = 'VNet-01',

        [Parameter(Mandatory = $false)]
        [String]$VnetRGName = 'Connectivity',

        [Parameter(Mandatory = $false)]
        [String]$SubnetName = 'default',

        [Parameter(Mandatory = $false)]
        [String]$Location = 'AustraliaEast',

        [Parameter(Mandatory = $false)]
        [String]$User = 'iacadmin',

        [Parameter(Mandatory = $false)]
        [String]$Password = 'MyC0mplexP@ssWord!',

        [Parameter(Mandatory = $false)]
        [String]$StorageAccountName,

        [Parameter(Mandatory = $false)]
        [String]$ConnectionString
    )

    ## Create Resource Group if it doesn't exist
    if (-not (Get-AzResourceGroup -Name $RGName -ea:si)) {
        $Rg = New-AzResourceGroup -Name $RGName -Location $Location
    }

    ## Get vnet, subnet and Backend pool objects
    $VnetParams = @{
        Name              = $VnetName
        ResourceGroupName = $VnetRGName
    }

    $Vnet = Get-AzVirtualNetwork @VnetParams
    $Subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $Vnet

    $BePoolParams = @{
        ResourceGroupName = $RGName
        LoadBalancerName  = $LbName
        Name              = $PoolName
    }

    $BePool = Get-AzLoadBalancerBackendAddressPool @BePoolParams

    ## Deploy Availability Set
    $AvSetParams = @{
        Location                  = $Location
        Name                      = "$VMBaseName-avset"
        ResourceGroupName         = $RGName
        Sku                       = 'Aligned'
        PlatformFaultDomainCount  = 2
        PlatformUpdateDomainCount = 2
    }

    $AvSet = New-AzAvailabilitySet @AvSetParams

    for ($i = 1; $i -lt $VMInstances + 1; $i++) {
        $Id = '{0:d3}' -f $i

        ## Create network interface
        $NicParams = @{
            ResourceGroupName              = $RGName
            Location                       = $Location
            Name                           = "$VmBaseName$id-nic"
            LoadBalancerBackendAddressPool = $BePool
            Subnet                         = $Subnet
        }

        $Nic = New-AzNetworkInterface @NicParams

        ## Create a username and password for the virtual machine.
        ## You wouldn't have credentials in your code.
        ## This is for demonstration purposes only.
        $Pw = ConvertTo-SecureString $Password -AsPlainText -Force
        $Cred = New-Object PSCredential $User, $Pw

        ## Create a virtual machine configuration
        $VmSize = 'Standard_DS1_v2'
        $Pub = 'MicrosoftWindowsServer'
        $Offer = 'WindowsServer'
        $Sku = '2019-Datacenter'

        $VmConfigParams = @{
            VMName            = "$VmBaseName$Id"
            VMSize            = $VmSize
            AvailabilitySetId = $($AvSet.Id)
        }

        $VMOSParams = @{
            Windows      = $true
            ComputerName = "$VmBaseName$Id"
            Credential   = $Cred
        }

        $VMSourceImageParams = @{
            PublisherName = $Pub
            Offer         = $Offer
            Skus          = $Sku
            Version       = 'latest'
        }

        $VMNicParams = @{
            Id = $Nic.Id
        }

        $VmConfig = New-AzVMConfig @VmConfigParams
        $VmConfig = $VmConfig | Set-AzVMOperatingSystem @VMOSParams
        $VmConfig = $VmConfig | Set-AzVMSourceImage @VMSourceImageParams
        $VmConfig = $VmConfig | Add-AzVMNetworkInterface @VMNicParams

        ## Create a virtual machine using the configuration
        $VmParams = @{
            ResourceGroupName = $RGName
            Location          = $Location
            VM                = $VmConfig
        }

        New-AzVM @VmParams
    }

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
}
