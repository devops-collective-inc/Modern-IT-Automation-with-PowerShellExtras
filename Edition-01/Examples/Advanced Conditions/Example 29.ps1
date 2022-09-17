# Example 1: Searching
$value = [Colors]'Red, Green, Blue'
$value = $value -band [Colors]'Red, Yellow'
$value

# Example 1a: Return the integer.
[int]$value
