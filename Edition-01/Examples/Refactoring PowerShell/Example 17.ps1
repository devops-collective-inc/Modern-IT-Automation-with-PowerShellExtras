#
# Example 1
# The string length 'value' is larger then three characters when
# using the left-hand alignment.
$String = "'{0,3}'" -f 'value'
$String
#
# Example 2
# Let's swap sides and now try the right-hand
# alignment.
$String = "'{0,-3}'" -f 'value'
$String
