$Path = Join-Path -Path 'Cert:\CurrentUser\My' -ChildPath $Cert.Thumbprint
Get-Item -Path $Path | Select-Object -Property *
