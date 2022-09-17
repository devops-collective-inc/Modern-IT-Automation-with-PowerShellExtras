    #
    # ValidatePattern Function
    function Invoke-Something {
        param(
            # Add the first attribute
            [Parameter(Mandatory)]
            [ValidatePattern('^(Value)[0-9]$')]
            [String]$Parameter
        )
        $Parameter
    }

    #
    # Example 1: ValidatePattern
    Invoke-Something -Parameter 'Value9'

    #
    # Example 2: ValidatePattern Bad Input
    Invoke-Something -Parameter 'SomeOtherValue'
