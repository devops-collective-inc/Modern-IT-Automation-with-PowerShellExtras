function MatchWithOpts {
    param ($String, $Opts)

    Write-Output (
        [Environment]::Newline +
        $Opts + ':' + [Environment]::Newline +
        'Name Offset Value' + [Environment]::Newline +
        '---- ------ -----'
    )

    $MyMatch = [regex]::Match($String,
        '([A-Za-z]:)?(\\+(?<dir>[^\\/:*?"<>|]*))+', $Opts)

    $MyMatch.Groups.ForEach{
        $Group = $_.Name
        $_.Captures.ForEach{
            Write-Output (
                '{0,-5}{1,-7}{2}' -f $Group, $_.Index, $_.Value
            )
        }
    }
}

$MyString = 'C:\Program Files\PowerShell\7\Modules'

MatchWithOpts $MyString 'None'

MatchWithOpts $MyString 'ExplicitCapture'
