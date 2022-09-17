# Example 1: Null-soaking in default mode
$obj = [PSCustomObject]@{
    Property = $null
}
$obj.Property.SecondProperty.ThirdProperty -eq $null

# Example 2: Reference errors in strict mode
Set-StrictMode -Version 2
$obj.Property.SecondProperty -eq $null

# Example 3: Safe access to null properties with ?.
$obj.Property?.SecondProperty -eq $null

# Example 4: The ?. operator doesn't protect against nonexistent properties
# in strict mode
${obj}?.AnotherProperty -eq $null

Set-StrictMode -Off
