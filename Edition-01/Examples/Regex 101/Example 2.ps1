$MyString = 'It rained on Friday, but Monday will be clear.'

$MyPattern = 'Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday'

$MyString -match $MyPattern
