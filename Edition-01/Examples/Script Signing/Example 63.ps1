$JSON = ConvertFrom-Json -InputObject $JSONRaw
$DN = (Get-ADCSTemplate -DisplayName 'My Code Signing').DistinguishedName
Set-ADObject -Identity $DN -Add @{
  'msPKI-RA-Application-Policies' = $JSON.'msPKI-RA-Application-Policies'
}
