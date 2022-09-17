# Example 1: Use of a break statement in a singular array
$string = 'value'
switch ($string) {
    'value' {
        'This matches'
        # Add the break statement
        break
    }
    # Note that the matching condition is the same as
    # the previous condition. Without the break statement,
    # this wouldn't be skipped.
    'value' {
        'This also matches'
    }
    'values' {
        'This does not match'
    }
}

# Example 2: Use of a continue statement in a singular array
#            This example is the same as the previous example, except
#            replaces 'break' with 'continue'.
#            Note how the statement executes the same with a singular array.

$string = 'value'
switch ($string) {
    'value' {
        'This matches'
        # This time add the continue statement
        continue
    }
    # Note that the matching condition is the same as
    # the previous condition. Without the continue statement,
    # this wouldn't be skipped.
    'value' {
        'This also matches'
    }
    'values' {
        'This does not match'
    }
}

# Example 3: Use of a break statement in an array
#            This is the same execution path in Example 1,
#            however, notice how the break statement
#            stops matching with the current and future iterations.

$string = 'value','value'
switch ($string) {
    'value' {
        'This matches'
        # Add the break statement
        break
    }
    # Note that the matching condition is the same as
    # the previous condition. Without the break statement,
    # this wouldn't be skipped.
    'value' {
        'This also matches'
    }
    'values' {
        'This does not match'
    }
}

# Example 4: Use of a continue statement in an array
#            This is the same execution path in Example 2,
#            however notice how the continue statement
#            stops matching with the current iteration, but
#            continues with future iterations.

$string = 'value','value'
switch ($string) {
    'value' {
        'This matches'
        # This time add the continue statement
        continue
    }
    # Note that matching condition is the same as
    # the previous condition. Without the break statement,
    # this wouldn't be skipped.
    'value' {
        'This also matches'
    }
    'values' {
        'This does not match'
    }
}
