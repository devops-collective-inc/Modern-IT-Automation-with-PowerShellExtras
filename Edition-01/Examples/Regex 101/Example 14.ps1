$Result = [regex]::Matches(
    'abcdefg hijklmn', '(?:(?<first>\w)(?<second>\w))+'
)

if ($Result.Success) {
    $matchCount = -1
    $Result.ForEach{
        Write-Host ('Match {0}:' -f ++$matchCount)
        $groupCount = -1
        $_.Groups.ForEach{
            Write-Host ('  Group {0} (Name = {1}):' -f ++$groupCount, $_.Name)
            $captureCount = -1
            $_.Captures.ForEach{
                Write-Host (
                    '    Capture {0} (pos {1}) = {2}' -f
                    ++$captureCount, $_.Index, $_.Value
                )
            }
        }
    }
} else { Write-Host 'No matches' }
