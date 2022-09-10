$Params = @{
  Uri = 'http://pki.example.com/AIA/MyIssuingCA.crt'
  AddToCertificateAia = $true
  Force = $true
}
Add-CAAuthorityInformationAccess @Params
