$MyData = @'
UID\Badge\Surname\Forename
f6b1b4b2-aeb9-45d7-b201-07b89065d448\15053636\Bloggs\Joe
bfb59409-5551-4863-8510-1d5cb5249294\94848749\Doe\Jane
4862a021-686e-4c40-b0b3-9c03a9c9687e\63847412\Smith\John
'@ -split '\r?\n'

if ($MyData[1] -imatch '^[\da-f\-]+(.+?)\d+\1\w+\1\w+$') {
    $Delimiter = $Matches[1]
} else {
    Write-Error -Message 'Couldn''t find delimiter'
}

Write-Host 'Will fail below here because of a bad regex pattern'
$Headers = $MyData[0] -split $Delimiter
Write-Host 'Will fail above here'

# Escape() corrects this
$Delimiter = [regex]::Escape($Delimiter)

$Headers = $MyData[0] -split $Delimiter

$MyData | Select-Object -Skip 1 | ForEach-Object {

    $entry = @{}
    $columns = [regex]::Split($_, $Delimiter)

    for ($col = 0; $col -lt $columns.Count; $col++) {

        $entry[$Headers[$col]] = $columns[$col]

    }

    [PSCustomObject]$entry

}
