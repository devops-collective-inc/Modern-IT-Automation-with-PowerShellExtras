$CA = Connect-CertificationAuthority
$Params = @{
  Path = $env:SystemDrive
  ChildPath = 'CA02.ad.example.net_My Issuing CA.req'
}
$Path = Join-Path @Params
Submit-CertificateRequest -Path $Path -CertificationAuthority $CA
