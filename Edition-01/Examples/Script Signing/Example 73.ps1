$JPParams = @{
  Path = 'HKLM:\SOFTWARE\Microsoft\SystemCertificates\ROOT\Certificates'
  ChildPath = $Thumbprint
}
$Path = Join-Path @JPParams
$CertBlob = Get-ItemPropertyValue -Path $Path -Name 'Blob'
$GPOCertContainerPath = 'HKLM\SOFTWARE\Policies\Microsoft\SystemCertificates'
$Key = "$GPOCertContainerPath\TrustedPublisher\Certificates\$Thumbprint"
$SGParams = @{
  Name = $GPOName
  Key = $Key
  ValueName = 'Blob'
  Value = $CertBlob
  Type = 'Binary'
}
Set-GPRegistryValue @SGParams
