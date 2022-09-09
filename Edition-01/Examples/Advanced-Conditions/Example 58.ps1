# Example 1: Create an Object. However, the property is $null
$obj = [PSCustomObject]@{
    Property = $null
}
# Note that the property returns nothing
${obj}?.Property
# Let's test to make sure it's null
${obj}?.Property -eq $null

# Example 2: Create an Object and select a different property:
$obj = [PSCustomObject]@{
    Property = 'value'
}
# Note that the property returns nothing
${obj}?.AnotherProperty
# Let's test to make sure it's null
${obj}?.AnotherProperty -eq $null
