#Requires -Modules "powershell-yaml"
#
# Example 1: Serialize a PowerShell Object to YAML
$Object = [PSCustomObject]@{
    Property        = 'Value'
    AnotherProperty = 'AnotherValue'
}
$Object | ConvertTo-Yaml
#
# Example 2: Deserialize a YAML string into a PowerShell Object
$Text = @'
Property: Value
AnotherProperty: AnotherValue
'@
$Deserialized = $Text | ConvertFrom-Yaml
$Deserialized
#
# Example 3: Show the PowerShell Object Type of a Deserialized YAML string.
$Deserialized.GetType() | Select-Object Name, BaseType
