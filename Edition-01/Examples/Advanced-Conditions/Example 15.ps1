# Example 1: Simple String Test with [string] type
$string = 'this is a string'
$string.GetType().Name
$string -is [string]


# Example 2: Simple String Test with [int] type
$string = 'this is a string'
$string.GetType().Name
$string -is [int]


# Example 3: String Array Test with [string[]]
$arr = @(
    'this is a string'
    'this is also a string'
    'this is some other string'
)
$arr -is [string[]]


# Example 4: String Array Test with [array] type
$arr = @(
    'this is a string'
    'this is also a string'
    'this is some other string'
)
$arr -is [array]


# Example 5: String Array Test with Explicit Cast
[string[]]$arr = @(
    'this is a string'
    'this is also a string'
    'this is some other string'
)
$arr -is [string[]]
