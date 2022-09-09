Get-ChildItem -Path 'Cert:\LocalMachine\My' |
    Where-Object -FilterScript {$_.Subject -eq 'CN=MySelfCodeSigningCert'}
