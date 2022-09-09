Configuration DeployMyRootCertificate
{
    Import-DscResource -ModuleName CertificateDsc

    Node localhost
    {
        CertificateImport MyRootCertificate
        {
            Thumbprint = '0000000000000000000000000000000000000000'
            Location   = 'LocalMachine'
            Store      = 'Root'
            Path       = '\\ad.example.net\NETLOGON\ROOTCA01_My Root CA.crt'
        }
    }
}
