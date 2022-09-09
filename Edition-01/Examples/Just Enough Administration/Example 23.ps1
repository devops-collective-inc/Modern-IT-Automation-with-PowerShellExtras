Configuration DisableDefaultPowerShellRemoting
{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'WSManDsc'

    Node $AllNodes.Where{$_.PSRemotingEnabled}.NodeName {
        Script EnablePowerShellRemoting {
            SetScript = {
                Get-PSSessionConfiguration -Name microsoft.* |
                    Disable-PSSessionConfiguration
            }
            GetScript = {
                # Fetch all OOBE default PS sessions.
                @{
                    Result = Get-PSSessionConfiguration -Name microsoft.*
                }
            }
            TestScript = {
                $state = [scriptblock]::Create($GetScript).Invoke() |
                            Where-Object Enabled -eq $true
                $state.Result -contains $true
            }
        }
    }
}
