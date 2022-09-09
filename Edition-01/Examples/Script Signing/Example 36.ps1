$JPParams = @{
  Path = $env:SystemDrive
  ChildPath = 'ROOTCA01_My Root CA.crt'
}
$RootCRTPath = Join-Path @JPParams
$ICParams = @{
  FilePath = $RootCRTPath
  CertStoreLocation = 'Cert:\LocalMachine\Root\'
}
Import-Certificate @ICParams
