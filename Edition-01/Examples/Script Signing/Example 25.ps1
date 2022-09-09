$Params = @{
  Uri = 'http://pki.example.com/AIA/MyRootCA.crt'
  AddToCertificateAia = $true
  Force = $true
}
Add-CAAuthorityInformationAccess @Params
