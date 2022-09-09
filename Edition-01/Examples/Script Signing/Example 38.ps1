$Params = @{
  CACommonName = 'My Issuing CA'
  CryptoProviderName = 'ECDSA_P256#Microsoft Software Key Storage Provider'
  KeyLength = 256
  HashAlgorithmName = SHA256
  CAType = 'EnterpriseSubordinateCA'
  Force = $true
}
Install-AdcsCertificationAuthority @Params
