$BEUnicode = [System.Text.Encoding]::BigEndianUnicode
$CopyrightSymbol = $BEUnicode.GetString(@(0x00, 0xA9))
$DDaggerSymbol = $BEUnicode.GetString(@(0x20, 0x21))

$CopyrightSymbol -match '\u00A9'
$CopyrightSymbol -match '\p{IsLatin-1Supplement}'

$DDaggerSymbol -match '\u2021'
$DDaggerSymbol -match '\p{Po}'
$DDaggerSymbol -match '\p{P}'
