$Params = @{
  Path = $env:SystemRoot
  ChildPath = 'system32\CertSrv\CertEnroll\MyRootCA.crl'
}
$LocalCRLPath = Join-Path @Params
Add-CACrlDistributionPoint -Uri $LocalCRLPath -PublishToServer -Force
