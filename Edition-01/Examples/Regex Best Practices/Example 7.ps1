$MyString = '0xF0 0x9F 0x8C 0x8A 0xF0 0x9F 0xA6 0x94 0xF0 0x9F 0x8F 0xA1'
$MyPattern = '(?i)(0xF[0-4])(?: (0x[89a-f][0-9a-f])){3}'
$Utf8FourByte = [regex]::Matches($MyString, $MyPattern)
$ApiUrl = 'https://ucdapi.org/unicode/latest/chars/{0}'

$Utf8FourByte | ForEach-Object -Parallel {
    $LockTaken = $false
    try {
        [System.Threading.Monitor]::Enter($_.Groups.SyncRoot, [ref]$LockTaken)
        $LeadingByte = $_.Groups[1].Captures[0].Value
        $ContinuationBytes = $_.Groups[2].Captures.ForEach{ $_.Value }
        $UTF8 = $_.Groups[0].Value -ireplace '0x([0-9a-f]{2})', '$1'
    }
    catch { Write-Error -ErrorRecord $_; return }
    finally {
        if ($LockTaken) {
            [System.Threading.Monitor]::Exit($_.Groups.SyncRoot)
        }
    }

    $Bytes = [byte[]]::new(4)
    $Bytes[0] = $LeadingByte -as [byte]
    for ($i = 0; $i -lt $ContinuationBytes.Count; $i++) {
        $Bytes[$i + 1] = $ContinuationBytes[$i] -as [byte]
    }

    $Char = [System.Text.Encoding]::UTF8.GetString($Bytes)
    $Data = Invoke-Restmethod -Uri ($using:ApiUrl -f $Char)

    [pscustomobject]@{
        UTF8      = $UTF8
        CodePoint = 'U+' +
            [System.Convert]::ToString($Data.codePoint, 16).ToUpper()
        Char      = $Char
        Name      = $Data.name ? $Data.name : $Data.name1
    }
}
