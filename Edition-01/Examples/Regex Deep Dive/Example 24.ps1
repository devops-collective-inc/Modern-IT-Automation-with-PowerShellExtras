$WithId = '<div id="some-id" class="styleA styleB">'
$WithoutId = '<div class="styleA styleB">'

$MyRegex = [regex]::new('(?mi)^<div(?([^>]+id="[^"]+")(?:\s*(?<name>[^"]+)=' +
    '"(?<value>[^"]+)")*\s*|(?<attribs>[^>]+))>$')

$ProccessMatches = {
    param($Match)
    Write-Host '  Attributes:'
    $Names = $Match.Groups['name'].Captures
    $Values = $Match.Groups['value'].Captures
    for ($i = 0; $i -lt $Names.Count; $i++) {
        Write-Host (
            '    {0} = {1}' -f $Names[$i].Value,
                ($Values[$i].Value -split ' ' -join ', ')
        )
    }
    Write-Host (
        '  Raw attributes: [' + $Match.Groups['attribs'].Value + ']'
    )
}

Write-Host 'With Id:'
& $ProccessMatches -Match $MyRegex.Match($WithId)

Write-Host 'Without Id:'
& $ProccessMatches -Match $MyRegex.Match($WithoutId)
