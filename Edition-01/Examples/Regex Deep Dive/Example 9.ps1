$Array = 'a' .. 'p'
-join ($Array -match '[a-k-[h-z]]') # Matches a-k except h-k, l-z ignored
-join ($Array -match '[a-k-[^j-z]]') # Matches nothing but j-k, l-z ignored
-join ($Array -match '[a-k-[b-g-[cd]]]') # Matches a-k, except b and e-g
