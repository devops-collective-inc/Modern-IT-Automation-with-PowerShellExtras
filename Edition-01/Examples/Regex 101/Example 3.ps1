$MyRegex = '\w\w\w\wday'

'Tomorrow is a holiday.' -match $MyRegex
'Tomorrow is Monday.' -match $MyRegex
'Tomorrow is Wednesday.' -match $MyRegex
