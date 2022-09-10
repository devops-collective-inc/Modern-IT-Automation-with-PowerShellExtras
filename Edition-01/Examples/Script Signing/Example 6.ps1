$SigningCert = $Cert
$TrustPubStor = [System.Security.Cryptography.X509Certificates.X509Store]::new(
  [System.Security.Cryptography.X509Certificates.StoreName]::TrustedPublisher,
  [System.Security.Cryptography.X509Certificates.StoreLocation]::LocalMachine
)
$TrustPubStor.Open(
    [System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite
)
$TrustPubStor.Add($SigningCert)
$TrustPubStor.Close()
