$Params = @{
    Certificate = $Cert
    FilePath = $ScriptPath
    TimestampServer = 'http://timestamp.digicert.com'
}
Set-AuthenticodeSignature @Params
