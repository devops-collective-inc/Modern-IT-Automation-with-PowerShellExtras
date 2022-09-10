$MyPattern = '(?<Open>\()[^\(\)]+(?<Close-Open>\))'
$MyString = 'Some of this sentence is (enclosed in parentheses).'

$Result = [regex]::Match($MyString, $MyPattern)

if ($Result.Success) {
    $Result.Groups.ForEach{
        Write-Host ('Group {0}:' -f $_.Name)
        $_.Captures.ForEach{
            Write-Host ('  Capture: "{0}"' -f $_.Value)
        }
    }
}
