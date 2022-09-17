# Example 1: Accessing an array element with []
$arr = 1,2,3,4
$arr[1]

# Example 2: Accessing an array element with ?[]
# Note: The variable needs to be wrapped with curly braces:
$arr = 1,2,3,4
${arr}?[1]

# Example 3: Accessing an array element that doesn't
# exist, without the operator.
$arr = $null
$arr[10] -eq $null

# Example 4: The same example as before, however
# using the ?[] operator.
$arr = $null
${arr}?[10] -eq $null

# Example 5: A Complex Object Structure.
$objlist = $null
${objlist}?[10].List?[10] -eq $null
