    #
    # ValidateCount Function
    function Invoke-Something {
        param(
            # Add the first attribute
            [Parameter(Mandatory)]
            # Minimum Length is 5
            # Maxiumum Length is 7
            [ValidateCount(5, 7)]
            # Note the type of the string
            [String[]]$Parameter
        )
        $Parameter -join ' '
    }

    #
    # Example 1: Count
    Invoke-Something -Parameter 1, 2, 3, 4, 5

    #
    # Example 2: ValidateLength. Too Short
    Invoke-Something -Parameter 1

    #
    # Example 3: ValiadateLength. Too Long
    Invoke-Something -Parameter 1, 2, 3, 4, 5, 6, 7, 8
