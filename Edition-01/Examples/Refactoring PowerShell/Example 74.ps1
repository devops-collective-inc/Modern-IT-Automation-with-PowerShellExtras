#
# Example 1: Serialize an Object as CLIXML
$Processes = Get-Process | Select-Object -First 1
$Processes | Export-Clixml -Path 'SomePath.clixml'
#
# Example 2: Note the object type
$Processes.GetType().Name
#
# Example 3: Deserialize a CLIXML file as an PowerShell Object.
$CustomObject = Import-Clixml -Path 'SomePath.clixml'
$CustomObject
#
# Example 4: Note the object type
$CustomObject.GetType().Name
