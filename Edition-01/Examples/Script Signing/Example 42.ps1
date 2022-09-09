$Request = Get-PendingRequest -CertificationAuthority $CA
Approve-CertificateRequest -Request $Request
