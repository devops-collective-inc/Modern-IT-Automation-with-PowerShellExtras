# Example 1: $var will not be $null
$var = 'not-null'
$var ??= 'is null'
$var

# Example 2: $var will be $null
$var = $null
$var ??= 'is null'
$var

# Example 3: $var will be Empty String
$var = ''
$var ??= 'is null'
$var
