Configuration Configure-IISServer
{
    param (
        [String[]]$ComputerName = 'localhost',
        [String]$ConnectionString
    )
    Node $ComputerName
    {
        ## Install IIS
        WindowsFeature AddIIS {
            Ensure = 'Present'
            Name   = 'Web-Server' # Internal name for IIS
        }
        ## Manipulate home page to display custom strings
        Script EditStartPage {
            GetScript  = { @{ Result = { "" } } }
            SetScript  = {
                $GetContentParams = @{
                    Path = "$env:SystemDrive\inetpub\wwwroot\iisstart.htm"
                }
                $File = Get-Content @GetContentParams
                $NewFile = $File | ForEach-Object {
                    $_
                    if ($_ -match 'IIS Windows Server') {
                        '<h1>IaC and CaC: Better Together!</h1>'
                        "<h2>Connection String is $using:ConnectionString</h2>"
                    }
                }
                $SetContentParams = @{
                    Value = $NewFile
                    Path  = "$env:SystemDrive\inetpub\wwwroot\iisstart.htm"
                }
                Set-Content @SetContentParams
            }
            TestScript = {
                $GetContentParams = @{
                    Path = "$env:SystemDrive\inetpub\wwwroot\iisstart.htm"
                }
                $Content = Get-Content @GetContentParams
                if ($Content -match 'IaC and CaC') { return $true }
                else { return $false }
            }
        }
    }
}
