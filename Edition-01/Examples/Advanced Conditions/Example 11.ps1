# Example 1: Parse an array
$values = 'one','two','three','four'
switch ($values) {
    'one' { 'this is one' }
    'two' { 'this is two' }
    'three' { 'this is three' }
    default { 'default' }
}

# Example 2: Parse an array with loop control 'break' in the statement
$values = 'one','two','three','four'
switch ($values) {
    'one' { 'this is one' }
    'two' { break; }
    'three' { 'this is three' }
    default { 'default' }
}

# Example 3: Parse an array with loop control 'continue' in the statement
$values = 'one','two','three','four'
switch ($values) {
    'one' { 'this is one' }
    'two' { continue; }
    'three' { 'this is three' }
    default { 'default' }
}
