#
# Example 1: Basic Substitution
$value = 'string!'
"This is a $value"
#
# Example 2: Substitution using an Object
$obj = [PSCustomObject]@{
    Property = "string inside a property!"
}
"This is a $($obj.Property)"
#
# Example 3: Multiple string substitution
$value1 = 'is a'
$value2 = 'string!'
"This $value1 $value2"
