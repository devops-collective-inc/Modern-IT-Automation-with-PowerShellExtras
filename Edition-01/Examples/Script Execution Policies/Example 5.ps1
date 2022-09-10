$GPOName = '<Name of your Group Policy Object>'
$RegKey = 'HKLM\Software\Policies\Microsoft\Windows\PowerShell'

$SetGPOParams = @{
    Name      = $GPOName
    Key       = $RegKey
    ValueName = 'EnableScripts'
    Value     = 1
    Type      = 'DWORD'
}
Set-GPRegistryValue @SetGPOParams

$SetGPOParams.ValueName = 'ExecutionPolicy'
$SetGPOParams.Value     = 'AllSigned'
$SetGPOParams.Type      = 'String'
Set-GPRegistryValue @SetGPOParams
