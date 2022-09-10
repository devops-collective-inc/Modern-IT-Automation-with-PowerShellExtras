# 6 or more word characters before 'day'
$MyPattern = '\w{6,}day'

'Tuesday' -match $MyPattern # 4 letters before 'day'
'Wednesday' -match $MyPattern # 6 letters before 'day'
'Postholiday' -match $MyPattern # 8 letters before 'day'
