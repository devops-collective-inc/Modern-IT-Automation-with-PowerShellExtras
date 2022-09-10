# Example 1: Without -CaseSenitive:

$value = 'value'
switch ($value) {
    'vAlue' {
        'Wrong case'
    }
    'Value' {
        'Also wrong case'
    }
    'value' {
        'Match'
    }
}

# Example 2: With -CaseSenitive:
$value = 'value'
switch -CaseSensitive ($value) {
    'vAlue' {
        'Wrong case'
    }
    'Value' {
        'Also wrong case'
    }
    'value' {
        'Match'
    }
}
