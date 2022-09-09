# Same Describe/BeforeAll block as Example 22
Mock Invoke-RestMethod {
    throw (
        'Invoke-RestMethod called with unexpected parameters: {0}' -f (
            $PesterBoundParameters.Keys.ForEach{
                "$_ = $($PesterBoundParameters.$_)"
            } -join ', '
        )
    )
}
