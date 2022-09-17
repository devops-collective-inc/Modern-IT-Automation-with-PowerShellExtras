$MyString = 'May: The sunshine is mellow.'

[regex]::Replace($MyString, '\bm(\w+)\b', 'y$1')
