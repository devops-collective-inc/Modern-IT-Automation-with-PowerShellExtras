$MyString = '[ERROR] /dev/sdc1 is full'
$MyPattern = '(?mi)\[(?:error|warn *)\]'

# Note the two colons (::) used below
# Use these to access a STATIC method
[regex]::IsMatch($MyString, $MyPattern)

$MyRegex = [regex]::new($MyPattern)
# Note the period (.) used below
# Use these to access an INSTANCE method
$MyRegex.IsMatch($MyString)
