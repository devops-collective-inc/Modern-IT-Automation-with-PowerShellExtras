# With -Regex:

$value = 'value'
switch -Regex ($value) {
    # Match strings that contain exactly four characters
    '^\w{4}$' {
        'Skipped'
    }
    # Match strings that contain numerals
    '^[0-9]*$' {
        'Also Skipped'
    }
    # Match any string that contains alphanumeric characters.
    '^\w*$' {
        'Match'
    }
}
