$MyPattern = '\w{3,6}day'

'Today' -match $MyPattern # 2 letters before 'day'
'Tuesday' -match $MyPattern # 4 letters before 'day'
