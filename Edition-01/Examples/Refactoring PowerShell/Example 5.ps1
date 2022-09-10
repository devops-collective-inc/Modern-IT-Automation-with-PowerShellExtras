function Do-Something {
    param($Parameter1, $Parameter2, $Parameter3, $Parameter4)
    $PSBoundParameters.Keys.ForEach{
        '{0} = {1}' -f $_, $PSBoundParameters[$_]
    }
}
$Condition2 = $true

if ($Condition) {
    Do-Something -Parameter1 'Value' -Parameter2 'Value2'
}
elseif ($Condition2) {
    Do-Something -Parameter1 'Value' -Parameter3 'Value3'
}
