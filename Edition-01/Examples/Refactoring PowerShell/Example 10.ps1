#
# Top Level Object used in the examples
$obj = [PSCustomObject]@{
    Property       = "string inside a property!"
    SecondProperty = ' another string!'
    ThirdProperty  = 'And another!'
}
#
# Example 1: Completed String Interpolation.

# Note the complexity of the string.
"Initial $($obj.Property) $($obj.SecondProperty) $($obj.ThirdProperty)"
#
# Example 2: Refactor the initial interpolation.

# We can use the join operator to join the three strings together and then
# insert it into the output string. Note the complexity.
$string = $($obj.Property), $($obj.SecondProperty),
          $($obj.ThirdProperty) -join ' '
"This is the initial $string"
