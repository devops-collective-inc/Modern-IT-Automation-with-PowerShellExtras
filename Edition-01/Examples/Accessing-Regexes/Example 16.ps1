$MatchInfos = Get-Content $SampleLog -First 2 |
    Select-String -Pattern '\[.+?\]' -AllMatches

$MatchInfos.ForEach{
    '{0}, Line {1}: {2}' -f $_.Path, $_.LineNumber, $_.Line
    $_.Matches.ForEach{ "  Match: $($_.Value)" } # Match objects
}
