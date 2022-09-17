    #
    # ValidateSet Function
    function Invoke-Something {
        param(
            # Add the first attribute
            [Parameter(Mandatory)]
            [ValidateSet('Value1', 'Value2')]
            [String]$Parameter
        )
        $Parameter
    }

    #
    # Example 1: ValidateSet
    Invoke-Something -Parameter 'Value1'

    #
    # Example 2: ValidateSet: Unknown ParameterValue
    Invoke-Something -Parameter 'Unknown'
