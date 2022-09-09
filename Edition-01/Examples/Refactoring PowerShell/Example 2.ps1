#Requires -Version 5.1
#
# In this script, the Process and Windows Service
# data is formatted and joined:

$WindowsServices = Get-CimInstance -ClassName Win32_Service
$WindowsProcesses = Get-Process
$NewObj = @()

# Iterate through each of the processes and find Windows processes.
foreach ($WindowsProcess in $WindowsProcesses) {

    $matchedService = $WindowsServices | ForEach-Object {
        if ($WindowsProcess.Id -eq $_.ProcessId) { Write-Output $_ }
    }

    if ([Array]$matchedService.Count -eq 0) { continue }

    $NewObj += $WindowsProcess | Select-Object *,
        @{ Name = 'WindowsService'; Expression = { $matchedService } }

}

$NewObj | Where-Object { $_.WindowsService -ne $null } |
    Export-Clixml ProcessesWithServiceInfo.clixml
