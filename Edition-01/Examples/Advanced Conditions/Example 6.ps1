# With -Wildcard:

# Value contains white space on each side
$value = ' value '
switch -Wildcard ($value) {
    '*value*' {
        'This matches'
    }
    '*valu*' {
        'This also matches'
    }
    'value*' {
        'This does not match'
    }
}
$output
