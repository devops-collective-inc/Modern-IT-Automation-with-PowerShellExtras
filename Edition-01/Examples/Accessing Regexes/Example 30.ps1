$Headers = 'UUID', 'LastName', 'FirstName', 'TaxCode'
$MyRegex = [regex]::new('/')

$Data = @'
d8eb7ea9/9f83/4070/b989/a82025a575bd/Smith/John/1250/L
2ec4e828/449f/4f98/a182/b2980480a9eb/Doe/Jane/1250/L
785d343d/7fe0/4c29/837a/5e990826ca4b/Bloggs/Joe/290/LX
'@

# Separate data into lines with static Split()
$Lines = [regex]::Split($Data, '\r?\n')

$Lines.ForEach{
    # Create hashtable for employee data
    $entry = @{}

    # Separate into 4 columns max, starting at end of UUID
    $columns = $MyRegex.Split($_, 4, 36)

    # Iterate through columns and add to $entry in format:
    # ColumnName = Data
    for ($col = 0; $col -lt $columns.Count; $col++) {
        $entry[$Headers[$col]] = $columns[$col] -replace '/'
    }

    # Output employee data
    [PSCustomObject]$entry
}
