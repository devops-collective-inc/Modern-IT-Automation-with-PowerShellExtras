$MyPattern = '\w[,."'':;?!]'

'This sentence has no punctuation' -match $MyPattern
'This is punctuated with a period.' -match $MyPattern
'The period in "1.2" also matches' -match $MyPattern
