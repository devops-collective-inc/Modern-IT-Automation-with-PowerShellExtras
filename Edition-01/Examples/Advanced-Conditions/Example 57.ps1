# Example 1: Create an Object and Select a Property
# Nothing is changed here.

$obj = [PSCustomObject]@{
    Property = 'Value'
}
$obj.Property

# Example 2: Create an Object and Select the Property
# using a Null Conditional Operator

$obj = [PSCustomObject]@{
    Property = 'Value'
}
# Note that the variable needs to be wrapped in curly braces:
${obj}?.Property
