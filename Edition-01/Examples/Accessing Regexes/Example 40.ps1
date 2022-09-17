$Text = 'a1b1c1a2b2c2'
$TwoChars = '.{2}'
$Greedy = '(?<L>.+)(?<R>.+)'

Write-Host (
    'First pair, no options: ' +
    [regex]::Match($Text, $TwoChars, 'None').Value
)

Write-Host (
    'First pair, right-to-left: ' +
    [regex]::Match($Text, $TwoChars, 'RightToLeft').Value
)

$GreedyLtr = [regex]::Match($Text, $Greedy, 'None')
Write-Host (
    'Greedy sharing, no options:' + [Environment]::NewLine +
    '  $1 = ' + $GreedyLtr.Groups[1].Value + [Environment]::NewLine +
    '   L = ' + $GreedyLtr.Groups['L'].Value + [Environment]::NewLine +
    '  $2 = ' + $GreedyLtr.Groups[2].Value + [Environment]::NewLine +
    '   R = ' + $GreedyLtr.Groups['R'].Value
)

$GreedyRtl = [regex]::Match($Text, $Greedy, 'RightToLeft')
Write-Host (
    'Greedy sharing, right-to-left:' + [Environment]::NewLine +
    '  $1 = ' + $GreedyRtl.Groups[1].Value + [Environment]::NewLine +
    '   L = ' + $GreedyRtl.Groups['L'].Value + [Environment]::NewLine +
    '  $2 = ' + $GreedyRtl.Groups[2].Value + [Environment]::NewLine +
    '   R = ' + $GreedyRtl.Groups['R'].Value
)
