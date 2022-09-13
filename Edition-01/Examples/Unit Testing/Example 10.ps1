$Params = @{
    Path      = './scripts/build'
    TagFilter = 'Unit', 'Integration'
    Output    = 'Detailed'
    PassThru  = $true
}

$Results = Invoke-Pester @Params
