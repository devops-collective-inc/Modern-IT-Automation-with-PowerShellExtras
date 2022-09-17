$MyString = 'May: The sunshine is mellow.'

$MyString -replace '\bm(\w+)\b', 'y$1'
$MyString -replace '([aeiou])'
