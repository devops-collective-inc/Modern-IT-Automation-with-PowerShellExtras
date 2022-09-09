$MyPattern = '(?im)(?<=(?<article>a|the) )(?>(?<noun>\w+))(?<!ing)(?!$)'
$MyString = @'
The cat sat on the mat eating a hat
The knitting needles fell on the floor again
'@

$MyMatches = [regex]::Matches($MyString, $MyPattern)

$MyMatches.ForEach{
    'Match "{0}"' -f $_.Value
    $_.Groups.Where{
        $_.Name -ne '0' # Exclude the $0 'whole match' group
    }.ForEach{
        ' ', $_.Name, '=', $_.Value -join ' '
    }
}
