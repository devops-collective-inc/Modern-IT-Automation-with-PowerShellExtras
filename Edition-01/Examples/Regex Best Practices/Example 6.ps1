$MyString = 'F09FA694'
$HexValues = [regex]::Match($MyString, '(?i)([a-f0-9]{2})+')
$SyncMatch = [System.Text.RegularExpressions.Match]::Synchronized($HexValues)

$ApiUrl = 'https://ucdapi.org/unicode/latest/codepoint/hex/{0}'
[ref]$Counter = 0

$SyncMatch.Groups[1].Captures | ForEach-Object -Parallel {
    $Index = [System.Threading.Interlocked]::Increment($using:Counter)

    Write-Verbose "[Thread $Index]: Processing match '$_'" -Verbose

    $Data = Invoke-Restmethod -Uri ($using:ApiUrl -f $_.Value)

    '[Thread {0} Result] 0x{1} ({2}) = {3}' -f
        $Index, $_.Value.ToUpper(), [Convert]::ToInt32($_.Value, 16),
        ($Data.name ? $Data.name : $Data.name1)
} -ThrottleLimit 3 -Verbose
