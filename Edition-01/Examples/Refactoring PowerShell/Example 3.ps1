
# Get the Items that are needed.
$WindowsServices = Get-CimInstance -ClassName Win32_Service

# Let's slow down here and explain each pipline step:

# Perform the Process Lookup, but since we have the Windows Services
# we can 'filter-left' and parse the Process id's directly into the cmdlet.
# This removes the Where-Object, filtering processes for only Windows Services.
# By utilizing filtering left, the number of objects have been reduced
# improving script execution performance.
Get-Process -Id $WindowsServices.ProcessId |
    # We can use select expressions to attach the matched
    # Windows Service object to the process object
    Select-Object *, @{
        Name = "WindowsService"
        Expression = {
            # We need to declare a variable here since the pipeline
            # token is lost when piped into where-object.
            $processId = $_.Id
            $WindowsServices | Where-Object { $_.ProcessId -eq $processId }
        }
    } |
    # Finally Export to CLIXML
    Export-Clixml ProcessesWithServiceInfo.clixml
