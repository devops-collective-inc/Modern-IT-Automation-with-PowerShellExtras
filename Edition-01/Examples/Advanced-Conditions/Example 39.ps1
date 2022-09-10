$arr = @(
    [Int]1,
    [DateTime]"05-15-2021",
    [String]"String",
    [Byte]14,
    [TimeSpan]15,
    [Bool]'True',
    [char]'C'
)

$arr -contains ([DateTime]"05-15-2021")
$arr -contains [Int]1
$arr -contains [String]'String'
$arr -contains [Byte]14
$arr -contains [TimeSpan]15
$arr -contains $true
$arr -contains [char]'C'
