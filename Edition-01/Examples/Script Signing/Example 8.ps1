$ScriptPath = Join-Path -Path $env:Temp -ChildPath 'test1.ps1'
Set-Content -Path $ScriptPath -Value 'Write-Host "Signed Script"'
$Cert = Get-ChildItem -Path 'Cert:\CurrentUser\My' -CodeSigningCert
Set-AuthenticodeSignature -Certificate $Cert -FilePath $ScriptPath
