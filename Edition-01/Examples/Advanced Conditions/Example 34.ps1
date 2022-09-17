$arr = 'string','bees','timber'
# Example 1
-not ($arr -like '*is not in list*')
# Example 2
($arr -like '*is not in list*').Count
# Example 3
($arr -like '*is not in list*').GetType()
