# Example 1: Typecasting "String" to [DateTime] using -as
"String" -as [DateTime]
$null -eq ("String" -as [DateTime])

# Example 2: Explicit casting [String] to [DateTime]
[DateTime]"String"
