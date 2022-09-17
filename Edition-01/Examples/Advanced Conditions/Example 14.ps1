# Parsing an Array

$values = @(
    # HashTable
    @{
        Key = 'HashTable Value'
    },
    # PSCustomObject
    [PSCustomObject]@{
        FirstProperty = 'Property Value'
        SecondProperty = 'Some other property value'
    }
    # DateTime
    ([datetime]::Now)
)

switch ($values) {
    { $_ -is [Hashtable] } {
        $_.Key
    }
    { $_ -is [PSCustomObject] } {
        $value = $_
        $_ | Get-Member -MemberType NoteProperty | ForEach-Object {
            $value."$($_.Name)"
        }
    }
    { $_ -is [DateTime] } {
        $_.Date.ToString()
    }
}
