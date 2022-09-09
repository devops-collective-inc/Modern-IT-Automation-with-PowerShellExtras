$Params = @{
  Path = $env:SystemRoot
  ChildPath = 'system32\CertSrv\CertEnroll\MyRootCA.crl'
}
$RootCRLPath = Join-Path @Params
Get-CertificateRevocationList -Path $RootCRLPath
