function New-AzureLoadBalancer {
    param (
        [Parameter(Mandatory = $false)]
        [String]$RGName = 'MyApp',

        [Parameter(Mandatory = $false)]
        [String]$LbName = 'MyLb',

        [Parameter(Mandatory = $false)]
        [String]$Location = 'AustraliaEast'
    )

    ## Create Resource Group if it doesn't exist
    if (-not (Get-AzResourceGroup -Name $RGName -ea:si)) {
        $Rg = New-AzResourceGroup -Name $RGName -Location $Location
    }

    ## Create public ip and place in variable
    $PublicIPParams = @{
        Name              = "$LbName-pip"
        ResourceGroupName = $RGName
        Location          = $Location
        Sku               = 'Basic'
        AllocationMethod  = 'static'
    }

    $Pip = New-AzPublicIpAddress @PublicIPParams

    ## Create load balancer frontend configuration and place in variable
    $FeIPParams = @{
        Name            = 'fePool'
        PublicIpAddress = $Pip
    }

    $FeIP = New-AzLoadBalancerFrontendIpConfig @FeIPParams

    ## Create Backend address pool configuration and place in variable
    $BePool = New-AzLoadBalancerBackendAddressPoolConfig -Name 'bePool'

    ## Create the health probe and place in variable
    $ProbeParams = @{
        Name              = 'healthProbe'
        Protocol          = 'http'
        Port              = '80'
        IntervalInSeconds = '360'
        ProbeCount        = '5'
        RequestPath       = '/'
    }

    $HealthProbe = New-AzLoadBalancerProbeConfig @ProbeParams

    ## Create the load balancer rule and place in variable
    $LbRuleParams = @{
        Name                    = 'HTTPRule'
        Protocol                = 'tcp'
        FrontendPort            = '80'
        BackendPort             = '80'
        IdleTimeoutInMinutes    = '15'
        FrontendIpConfiguration = $FeIP
        BackendAddressPool      = $BePool
    }

    $Rule = New-AzLoadBalancerRuleConfig @LbRuleParams

    ## Create the load balancer resource
    $LoadBalancerParams = @{
        ResourceGroupName       = $RGName
        Name                    = $LbName
        Location                = $Location
        Sku                     = 'Basic'
        FrontendIpConfiguration = $FeIP
        BackendAddressPool      = $BePool
        LoadBalancingRule       = $Rule
        Probe                   = $HealthProbe
    }

    $Lb = New-AzLoadBalancer @LoadBalancerParams

    return $Pip.IpAddress

}
