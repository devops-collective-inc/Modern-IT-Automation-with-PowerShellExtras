# Without capture
'Red,Green.Blue/Cyan:Magenta' -split '\p{P}', 3

# With capture
'Red,Green.Blue/Cyan:Magenta' -split '(\p{P})', 3

# Array
@('Red,Green.Blue', 'Cyan:Magenta') -split '\p{P}', 3
