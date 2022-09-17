$MyArray = @('red', 'yellow', 'green', 'blue', 'purple')
$MyPattern = '(\w)\1'

$MyArray -match $MyPattern
