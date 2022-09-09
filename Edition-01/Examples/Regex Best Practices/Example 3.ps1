$MyString = "The customer's name is Jane E. Doe."
$MyPattern = '(?mx)(?<=^\s*|[.?!]\s+)(?>[\(''"/:.]*([^.?!;,\s\(\)"''/]+)' +
    '[;,\)''"/]*\s*)+[.?!]+'

[regex]::Matches($MyString, $MyPattern).ForEach{
    Write-Host ('Sentence: "{0}"' -f $_.Value)
    $_.Groups[1].Captures.ForEach{
        Write-Host ('  Word: "{0}"' -f $_.Value)
    }
}
