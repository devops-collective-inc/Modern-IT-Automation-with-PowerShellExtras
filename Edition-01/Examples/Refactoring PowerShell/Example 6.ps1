# Parameter1 is a common parameter that's used in both lines of logic.
$Params = @{
    Parameter1 = 'Value'
}
# The Logic can be applied now:
# Either add the key 'Parameter2' or 'Parameter3' to the Hashtable.
if ($Condition) { $Params.Parameter2 = 'Value2' }
elseif ($Condition2) { $Params.Parameter3 = 'Value3' }

# Splat the contents of the Hashtable into the cmdlet.
Do-Something @Params
