$params = @{
    ComputerName = 'DC1'
    ConfigurationName = 'JEAMaintenance'
    ScriptBlock = { Get-Service }
}

Invoke-Command @params
