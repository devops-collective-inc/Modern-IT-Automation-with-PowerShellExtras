$MyString = '$5.23 (March)'

$NoCaptures = '\$\d+\.\d{2} \(\w+\)'
$Captures = '\$(\d+)\.(?<discount>\d{2}) \((\w+)\)'

$Replacement = '$$$1.00 ($$0.${discount} off until ${2})'

$MyString -replace $NoCaptures, $Replacement

$MyString -replace $Captures, $Replacement
