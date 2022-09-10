#
# Example 1: Basic Right Alignment
$String = "{0,10}" -f 'value'
# Note that the string length is exactly 10.
$String.Length
$String
#
# Example 2: Same as Example 1, wrapped with '' quotation marks
$String = "'{0,10}'" -f 'value'
$String.Length
$String
#
# Example 3: Basic Left Alignment
$String = "{0,-10}" -f 'value'
# Note that the string length is 10.
$String.Length
$String
#
# Example 4: Same as Example 3, wrapped with '' quotation marks
$String = "'{0,-10}'" -f 'value'
$String.Length
$String
#
# Example 5: The difference between a left and right-hand alignment

# LeftHand
$LHString = "'{0,-10} {0,-10}'" -f 'value'
# Note that the string length of each format item is exactly 10.

# RightHand
$RHString = "'{0,10} {0,10}'" -f 'value'
# Note that the string length of each format item is exactly 10.

$RHString
$LHString
#
# Example 6: What happens if we left-hand and right-hand in the same string?
$String = "'{0,10}{0,-10}'" -f 'value'
$String2 = "'{0,-10}{0,10}'" -f 'value'
$String
$String2
