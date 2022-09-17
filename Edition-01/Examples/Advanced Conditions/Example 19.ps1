# Example 1: Create an Enum and list it's properties.

# Create an Enum in PowerShell Called Colors
Add-Type -TypeDefinition @"
   public enum Colors
   {
      Red,
      Green,
      Blue,
      Yellow,
      Black,
      White
   }
"@

# Example 1:

# List the properties of the enum.
[Colors].GetEnumNames()


# Example 2:

# List the combinations:
foreach ($val in [Enum]::GetValues([Colors])) {
    "{0} {1}" -f [int]$val, $val
}

# Example 3:

# Casting enums as integer's and strings
[Colors]'Green'
[Colors]'Red'
[Colors]0 # Red
