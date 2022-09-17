    #
    # ValidateScript Function

    function Invoke-Something {
        param(
            # Add the first attribute
            [Parameter(Mandatory)]
            # In this example, we test the input
            # for a valid filepath
            [ValidateScript({
                # Access the current parameter by
                # using the $_ token:
                Test-Path -LiteralPath $_
            })]
            [String]$Parameter
        )
        $Parameter
    }

    #
    # Example 1: Using a known file path.
    Invoke-Something -Parameter "$PSHOME"

    #
    # Example 2: Using an unknown file path.
    Invoke-Something -Parameter 'D:\Bad\FilePath'
