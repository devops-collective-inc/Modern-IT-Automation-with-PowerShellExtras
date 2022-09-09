'5:5:' -match "(?'2'\d)\1" # Capture 1 doesn't exist, throws error

'5:5:' -match "(?'2'\d)(:)\1\2" # Expected order of captures
'5:5:' -match "(?'2'\d)(:)\2\1" # Actual order of captures
