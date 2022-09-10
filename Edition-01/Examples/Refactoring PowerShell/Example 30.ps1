#
# Function Definition
function Invoke-Something {
    param(
        # Add the Parameter Attribute and Include
        # the Mandatory Argument
        [Parameter(Mandatory)]
        [String]$Parameter1,
        [String]$Parameter2
    )
    'Complete!'
}
#
# Example 1: Call the Function without -Parameter1
Invoke-Something -Parameter2 ''
#
# Example 2: Call the Function with a -Parameter1 value
# and -Parameter2 without a value.
Invoke-Something -Parameter1 'Value' -Parameter2 ''
