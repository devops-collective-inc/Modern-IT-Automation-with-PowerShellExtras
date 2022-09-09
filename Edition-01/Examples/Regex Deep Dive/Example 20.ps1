$Numbers = '12230'

# Matches repeating digits
$Numbers -match '(\d)\1'

# Tries to match capture 130, which doesn't exist,
# so matches octal 130 (capital "X")
$Numbers -match '(\d)\130'

# Use an index enclosed with triangular bracket or
# single quotation mark to prevent the above issue
$Numbers -match '(\d)\<1>30'
$Numbers -match "(\d)\'1'30"

# Passing numeric indexes to \k results in the indexed capture,
# unless a capturing group was explicitly named with that number
$Numbers -match '(\d)\k<1>30'
$Numbers -match "(\d)\k'1'30"

# You can use either enclosed form for both
# the capturing group and the backreference
$Numbers -match "(?'repeat'\d)\k<repeat>"
$Numbers -match "(?<repeat>\d)\k'repeat'"
