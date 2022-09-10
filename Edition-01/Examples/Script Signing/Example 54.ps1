$Params = @{
  Path = $env:SystemRoot
  ChildPath = 'system32\CertSrv\CertEnroll\MyIssuingCA.crl'
}
$Path = Join-Path @Params
Add-CACrlDistributionPoint -Uri $Path -PublishToServer -Force
