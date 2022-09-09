$ExportPath = Join-Path -Path $env:TEMP -ChildPath ([guid]::NewGuid().Guid)
Export-Certificate -Cert $Certificate -FilePath $ExportPath
$Params = @{
  FilePath = $ExportPath
  CertStoreLocation = 'Cert:\LocalMachine\Root\'
}
Import-Certificate @Params
Remove-Item -Path $ExportPath
