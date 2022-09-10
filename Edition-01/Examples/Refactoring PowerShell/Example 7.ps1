if ($Condition) {
    Do-Something -Parameter1 'Value' -Parameter2 'Value2'
}
elseif ($Condition2) {
    # Splatted for line formatting in book.
    $Params = @{
        Parameter1 = 'NewValue'
        Parameter3 = 'Value3'
        Parameter4 = 'Value4'
    }
    Do-Something @Params
}
elseif ($Condition3) {
    Do-Something -Parameter3 'Value3'
}
else {
    Do-Something -Parameter1 'Value'
}
