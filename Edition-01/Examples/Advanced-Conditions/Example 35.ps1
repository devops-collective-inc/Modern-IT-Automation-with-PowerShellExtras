$arr = 'string','bees','timber'
# Output 1
$arr -notlike '*is not in list*'
# Output 2
($arr -notlike '*is not in list*').Count
