$RootCert = $Cert
$RootStore = [System.Security.Cryptography.X509Certificates.X509Store]::new(
    [System.Security.Cryptography.X509Certificates.StoreName]::Root,
    [System.Security.Cryptography.X509Certificates.StoreLocation]::LocalMachine
)
$RootStore.Open(
    [System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite
)
$RootStore.Add($RootCert)
$RootStore.Close()
