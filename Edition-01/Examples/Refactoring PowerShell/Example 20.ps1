#
# Example 1: String wrapping using single quotation marks within
# an expandable string
"{0:'Day: 'dddd d', Month: 'MMMM', Year: 'yyyy}" -f (Get-Date)
#
# Example 2: Same as Example 1, however using two single quotation
# marks to escape the literal string.
'{0:''Day: ''dddd d'', Month: ''MMMM'', Year: ''yyyy}' -f (Get-Date)
#
# Example 3: Same as Example 1, however using double quotation
# marks within a literal string.
'{0:"Day: "dddd d", Month: "MMMM", Year: "yyyy}' -f (Get-Date)
#
# Example 4: Same as Example 1, however using two double quotation
# marks to escape the expandable string.
"{0:""Day: ""dddd d"", Month: ""MMMM"", Year: ""yyyy}" -f (Get-Date)
