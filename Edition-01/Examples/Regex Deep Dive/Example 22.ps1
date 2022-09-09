$MyPattern = '(?nm)^(?!\s*#).+(\r?\n)*'
$MyString = @'
# Create the RNG
$CryptoRandGen = [System.Security.Cryptography.RNGCryptoServiceProvider]::new()

# Buffer to store random bytes
[byte[]]$bufferByte = [byte[]]::new(1)
'@

$MyString -replace $MyPattern
