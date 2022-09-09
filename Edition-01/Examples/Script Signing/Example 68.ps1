$Params = @{
  Template = 'MyCodeSigning'
  CertStoreLocation = 'Cert:\CurrentUser\My'
}
Get-Certificate @Params
