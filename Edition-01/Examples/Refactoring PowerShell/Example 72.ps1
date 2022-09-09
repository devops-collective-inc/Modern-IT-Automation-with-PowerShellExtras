#
# Example 1: Serializing an Object with CSV
$ObjectList = @(
    [PSCustomObject]@{
        Property        = 'Value'
        AnotherProperty = 'Another Value'
    }
    [PSCustomObject]@{
        Property        = 'Second Value'
        AnotherProperty = 'Second Another Value'
    }
)
$ObjectList | ConvertTo-Csv
#
# Example 2: Serializing a List with CSV
$ObjectList = Get-Process | Select-Object -First 2 -Property E*, H*, Id, Name
$ObjectList | ConvertTo-Csv
#
# Example 3: Serializing a CSV file
$ObjectList | Export-Csv -Path 'List.csv'
#
# Example 4: Deserializing a CSV File
Import-Csv -Path 'List.csv' | Select-Object Id, Name, Handles
#
# Example 5: Deserializing a CSV String
$string = @'
"Property","AnotherProperty"
"Value","Another Value"
"Second Value","Second Another Value"
'@
$String | ConvertFrom-Csv
#
# Example 6: Serializing Using a Different Delimiter
$ObjectList = @(
    [PSCustomObject]@{
        Property        = 'Value'
        AnotherProperty = 'Another Value'
    }
    [PSCustomObject]@{
        Property        = 'Second Value'
        AnotherProperty = 'Second Another Value'
    }
)
$ObjectList | ConvertTo-Csv -Delimiter '>'
#
# Example 7: De-Serializing Using a Different Delimiter
$String = @'
"Property">"AnotherProperty"
"Value">"Another Value"
"Second Value">"Second Another Value"
'@
$String | ConvertFrom-Csv -Delimiter '>'
