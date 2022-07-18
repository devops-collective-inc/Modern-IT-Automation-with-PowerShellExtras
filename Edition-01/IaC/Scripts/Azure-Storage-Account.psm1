function New-AzureStorageAccount {
    param (
        [Parameter(Mandatory = $false)]
        [String]$RGName = 'MyApp',

        [Parameter(Mandatory = $false)]
        [String]$StorageAccountName = 'myuniquestorage593x',

        [Parameter(Mandatory = $false)]
        [String]$Location = 'AustraliaEast'
    )

    ## Create Resource Group if it doesn't exist
    if (-not (Get-AzResourceGroup -Name $RGName -ea:si)) {
        $Rg = New-AzResourceGroup -Name $RGName -Location $Location
    }

    ## Create Storage Account
    $StorageAccountParams = @{
        Name              = $StorageAccountName
        ResourceGroupName = $RGName
        Location          = $Location
        SkuName           = 'Standard_LRS'
        Kind              = 'StorageV2'
    }

    $StorageAccount = New-AzStorageAccount @StorageAccountParams

    return $StorageAccount.StorageAccountName
}
