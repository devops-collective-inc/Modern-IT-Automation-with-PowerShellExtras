# While an explicit array cast is not required,
# it's used to associate a singular array item.
$strings = @('value')
# Iterate through each of the array items
foreach ($string in $strings) {
    #
    # Switch Conditions
    if ($string -eq 'value') {
        'matched'
    }
    if ($string -eq 'value2') {
        'not matched'
    }
    #
    # Default Statement
    # Note: How the "default" statement is structured.
    # The conditional logic explicitly tests all previous conditions.
    # and if $null, then is considered true.
    if (($string -ne 'value') -and ($string -ne 'value2')) {
        'default'
    }
}
