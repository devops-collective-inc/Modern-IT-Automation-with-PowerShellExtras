if (($Condition1) -and ($Condition2) -and ($Condition3)) {
    # Do Something
}
elseif (-not ($Condition1)) {
    # [First Condition] Do Something Else
}
elseif (($Condition1) -and (-not ($Condition2))) {
    # [Second Condition] Do Something Else
}
elseif (($Condition1) -and ($Condition2) -and (-not ($Condition3))) {
    # [Third Condition] Do Something Else
}
