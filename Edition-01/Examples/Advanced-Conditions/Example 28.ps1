[Flags()]
enum Colors
{
    Red = 1
    Green = 2
    Blue = 4
    Yellow = 8
    Black = 16
    White = 32
}

# Example 1: Combination
# In the following example, Red has been initially
# set within the variable $value.
# We will use the -bor operator to add Blue.
$value = [Colors]::Red
$value = $value -bor [Colors]::Blue
$value

# Example 1a: Return the integer.
[int]$value
