$string = 'Lets find the spot. OR should it go north?'
$string -replace '^(?:\S+\s){1}(\S+)', 'X marks'
