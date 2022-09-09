$Params = @{
  CACommonName = 'My Root CA'
  ValidityPeriod = 'Years'
  ValidityPeriodUnits = 10
  CryptoProviderName = 'ECDSA_P521#Microsoft Software Key Storage Provider'
  KeyLength = 521
  HashAlgorithmName = 'SHA512'
  CAType = 'StandaloneRootCA'
  Force = $true
}
Install-AdcsCertificationAuthority @Params
