# Example 1: A Simple Condition where it evaluates to be $true.
$result = ('value' -eq 'value') ? 'isPresent' : 'notPresent'
$result

# Example 2: A Simple Condition where it evaluates to be $false.
$result = ('value' -eq 'another value') ? 'isPresent' : 'notPresent'
$result

# Example 3: Using a different condition.
$result = ('value' -in
    ('value','option','selection')) ? 'isPresent' : 'notPresent'
$result
