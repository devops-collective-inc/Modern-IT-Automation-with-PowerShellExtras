$Path = Join-Path -Path $env:SystemDrive -ChildPath 'ROOTCA01_My Root CA.crt'
$Cert = [Security.Cryptography.X509Certificates.X509Certificate2]::new($Path)
$RCAADContainer = Get-AdPkiContainer -ContainerType RootCA
$AAParams = @{
  AdContainer = $RCAADContainer
  Certificate = $Cert
  Dispose = $true
}
Add-AdCertificate @AAParams | Format-List
