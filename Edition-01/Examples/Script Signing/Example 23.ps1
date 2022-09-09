$Params = @{
  Uri = 'http://pki.example.com/CDP/MyRootCA.crl'
  AddToCertificateCdp = $true
  Force = $true
}
Add-CACrlDistributionPoint @Params
