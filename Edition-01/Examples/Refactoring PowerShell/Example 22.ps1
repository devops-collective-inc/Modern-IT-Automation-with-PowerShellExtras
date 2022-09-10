# Example 1: Five 'd' operators results in the long day name
'{0:ddddd}' -f (Get-Date)
#
# Example 2: Separating these with an empty literal span solves the issue
'{0:dddd""d}' -f (Get-Date)
