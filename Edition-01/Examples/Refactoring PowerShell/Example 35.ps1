    #
    # ValidateLength Function
    function Invoke-Something {
        param(
            # Add the first attribute
            [Parameter(Mandatory)]
            # Minimum Length is 5
            # Maxiumum Length is 7
            [ValidateLength(5, 7)]
            [String]$Parameter
        )
        $Parameter
    }

    #
    # Example 1: ValidateLength
    Invoke-Something -Parameter 'Value'

    #
    # Example 2: ValidateLength. Too Short
    Invoke-Something -Parameter 'Two'

    #
    # Example 3: ValiadateLength. Too Long
    Invoke-Something -Parameter 'StringisTooLong'
