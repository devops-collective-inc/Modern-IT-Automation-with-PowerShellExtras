$Path = Join-Path $env:SystemDrive -ChildPath 'ROOTCA01_My Root CA.crt'
$Params = @{
  FilePath = $Path
  CertStoreLocation = 'Cert:\LocalMachine\Root\'
}
Import-Certificate @Params
