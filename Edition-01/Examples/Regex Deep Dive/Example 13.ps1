if ('abcdefg hijklmn' -match '(?:(\w)(?# Matches letter pairs)(\w))+') {
    $Matches
}
