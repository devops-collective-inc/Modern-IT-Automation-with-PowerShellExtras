# Installing the Module

Find-Module -Name WSManDsc -Repository PSGallery | Install-Module

# WSManConfig.ps1
#Requires -module WSManDsc

<#
    .DESCRIPTION
        Enable compatibility HTTP and HTTPS listeners, set
        maximum connections to 100.
#>

Configuration PowerShellRemoting
{

    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'WSManDsc'

    Node $AllNodes.Where{$_.PSRemotingEnabled}.NodeName {


        WSManServiceConfig ServiceConfig {

            IsSingleInstance                 = 'Yes'
            MaxConnections                   = 100
            AllowUnencrypted                 = $false
            AuthCredSSP                      = $false

        }

        Service EnableWinRM {
            Name = 'WinRM'
            StartupType = 'Automatic'
            State = 'Running'
        }

        Script EnablePowerShellRemoting {
            DependsOn = '[Service]EnableWinRM'

            SetScript = {
                Enable-PSRemoting
            }
            GetScript = {
                @{
                    Result = (
                        [Bool](New-PSSession . -ErrorAction SilentlyContinue)
                        -and [Bool](Test-WSMan -ComputerName .))
                }
            }
            TestScript = {
                $state = [scriptblock]::Create($GetScript).Invoke()
                $state.Result
            }
        }

    }
}
