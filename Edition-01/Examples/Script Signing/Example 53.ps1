$Params = @{
  Uri = 'http://pki.example.com/CDP/MyIssuingCA.crl'
  AddToCertificateCdp = $true
  Force = $true
}
Add-CACrlDistributionPoint @Params
