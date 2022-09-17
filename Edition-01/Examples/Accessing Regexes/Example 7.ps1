'Red, Green,, Blue' -split '[, ]+'
#   ^-     ^--
# 2 delimiter matches producing 3 chunks.
# Note the '+' quantifier

'Cyan, Magenta,, Yellow' -split '[, ]'
#    ^^       ^^^
# 5 delimiter matches producing 6 chunks,
# 3 of which are empty strings
