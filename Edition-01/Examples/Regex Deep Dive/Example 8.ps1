$Array = 'a' .. 'p'
-join $Array # Input string
-join ($Array -match '[a-k]') # Match a-k
-join ($Array -match '[a-k-[d]]') # Match a-k except d
