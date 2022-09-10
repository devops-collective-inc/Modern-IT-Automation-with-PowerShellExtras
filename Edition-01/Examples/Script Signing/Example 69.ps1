$Cert = Get-ChildItem -Path 'Cert:\CurrentUser\My'
$Cert | Format-List
