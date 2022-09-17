
$Condition2 = $true

# Parameter1 is the Common Value; set it initially.
$Params = @{
    Parameter1 = 'Value'
}

# Add Parameter2
if ($Condition) { $Params.Parameter2 = 'Value2' }

if ($Condition2) {
    # Update Parameter1
    $Params.Parameter1 = 'NewValue'
    # Add Parameter3 and Parameter4
    $Params.Parameter3 = 'Value3'
    $Params.Parameter4 = 'Value4'
}

if ($Condition3) {
    # Remove Parameter1
    $Params.Remove('Parameter1')
    $Params.Parameter3 = 'Value3'
}

Do-Something @Params
