$Params = @{
  Path = $env:SystemRoot
  ChildPath = 'system32\CertSrv\CertEnroll\My Root CA.crl'
}
$LocalCRLPath = Join-Path @Params
Get-CertificateRevocationList -Path $LocalCRLPath
