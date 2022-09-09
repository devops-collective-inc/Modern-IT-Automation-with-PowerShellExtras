$Certificate = Get-ChildItem -Path 'Cert:\CurrentUser\My' -CodeSigningCert
$Thumbprint = $Certificate.Thumbprint
