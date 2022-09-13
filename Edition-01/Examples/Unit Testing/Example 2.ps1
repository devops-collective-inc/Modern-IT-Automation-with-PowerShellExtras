# Example 2a: Checking Pester is installed from the PowerShell Gallery
Get-InstalledModule -Name Pester

# Example 2b: Checking the Pester version in the session
Import-Module -Name Pester
Get-Module -Name Pester
