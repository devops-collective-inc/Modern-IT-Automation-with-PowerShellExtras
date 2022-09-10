# Startup script
Set-Content -Value 'Write-Host "Startup!"' -Path 'C:\Temp\Startup.ps1'

# Implementing the change with PowerShell console
Get-PSSessionConfiguration -Name microsoft.powershell |
    Set-PSSessionConfiguration -StartupScript C:\TEMP\Startup.ps1
