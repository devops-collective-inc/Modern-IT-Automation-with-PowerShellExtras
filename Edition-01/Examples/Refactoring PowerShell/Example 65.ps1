#
# Example 1: Serialize as JSON
$Object = [PSCustomObject]@{
    Property        = 'Value'
    AnotherProperty = 'AnotherValue'
}
# Store the output into a variable
$JSONString = $Object | ConvertTo-Json
$JSONString
#
# Example 2: Deserialize JSON
$JSONString | ConvertFrom-Json

# Example 3: Explore Object Type
$Process = Get-Process | Select-Object -First 1
$Process.GetType() | Select-Object Name, BaseType
#
# Example 4: Using the Process Variable, let's serialize it

$JSONString = $Process | ConvertTo-Json
$JSONString.Length
#
# Example 5: Deserialize $JSONString and check the Object Type
($JSONString | ConvertFrom-Json).GetType() | Select-Object Name, BaseType
