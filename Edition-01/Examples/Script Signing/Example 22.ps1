$Params = @{
    Uri = 'http://pki.example.com/CDP/MyRootCA.crl'
    AddToCertificateCdp = $true
    AddToFreshestCrl = $true
    AddToCrlCdp = $true
    AddToCrlIdp = $true
    PublishToServer = $true
    Force = $true
}
Add-CACrlDistributionPoint @Params
