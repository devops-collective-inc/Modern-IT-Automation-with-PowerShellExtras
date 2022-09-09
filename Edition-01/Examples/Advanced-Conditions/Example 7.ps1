# With -Exact:

$value = 'value'
switch -Exact ($value) {
    'vAlue' {
        'Not skipped'
    }
    'Value' {
        'Also not Skipped'
    }
    'value' {
        'Match'
    }
}
