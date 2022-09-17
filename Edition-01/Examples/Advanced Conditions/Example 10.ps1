# Example 1: All other conditions will fail.
$string = 'value'
switch -CaseSensitive ($string) {
    'string' {
        'Skipped'
    }
    'another string' {
        'Also Skipped'
    }
    default {
        'default'
    }
}

# Example 2: The default statement is included, however won't be called.
# One of the conditions will succeed.
$string = 'value'
switch -CaseSensitive ($string) {
    'value' {
        'success'
    }
    'another string' {
        'Also Skipped'
    }
    default {
        'default'
    }
}
