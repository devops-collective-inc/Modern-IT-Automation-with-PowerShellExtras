#
# Function Code:
function Invoke-Something {
    [CmdletBinding(DefaultParameterSetName = 'P1')]
    param(
        [Parameter(ParameterSetName = 'P1')]
        [string]$Parameter1,
        [Parameter(ParameterSetName = 'P2')]
        [string]$Parameter2,
        [Parameter(ParameterSetName = 'P1')]
        [Parameter(ParameterSetName = 'P2')]
        [string]$Parameter3
    )

    # Print out the parameter set
    $PSCmdlet.ParameterSetName

}
#
# Example 1: Invoke the Function with no parameter
Invoke-Something
#
# Example 2: Invoke the Function with 'Parameter1'
Invoke-Something -Parameter1 ''
#
# Example 3: Invoke the Function with 'Parameter2'
Invoke-Something -Parameter2 ''
#
# Example 4: Invoke the Function with 'Parameter3'
Invoke-Something -Parameter3 ''
#
# Example 5: Invoke the Function with 'Parameter1' and 'Parameter2'
Invoke-Something -Parameter1 '' -Parameter2 ''
