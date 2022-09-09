$MyArray = @('Red Green', 'Blue/Cyan')

# Unary mode, splitting by white space
-split $MyArray

# Binary mode, splitting by white space or slashes '/'
$MyArray -split '[\s/]'
