Configuration DeployMySigningCertificate
{
    Import-DscResource -ModuleName CertificateDsc

    Node localhost
    {
        CertificateImport MySigningCertificate
        {
            Thumbprint = '0000000000000000000000000000000000000000'
            Location   = 'LocalMachine'
            Store      = 'TrustedPublisher'
            Path       = '\\ad.example.net\NETLOGON\Administrator.crt'
        }
    }
}
