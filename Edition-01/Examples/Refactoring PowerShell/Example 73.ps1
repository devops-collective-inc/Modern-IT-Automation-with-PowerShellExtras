#
# Example 1: Serialize a PowerShell Object as CLIXML
$PSObject = [PSCustomObject]@{
    Property        = 'Value'
    AnotherProperty = 'AnotherValue'
}
$PSObject | Export-Clixml -Path 'SomePath.clixml'
#
# Example 2: Note the object type
$PSObject.GetType().Name
#
# Example 3: Deserialize a CLIXML file as an PowerShell Object.
$Object = Import-Clixml -Path 'SomePath.clixml'
$Object
#
# Example 4: Note the object type
$Object.GetType().Name
#
# Example 5: What does a CLIXML file look like?
Get-Content -Path 'SomePath.clixml'
