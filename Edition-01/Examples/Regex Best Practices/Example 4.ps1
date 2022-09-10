$Sentences = @'
This sentence contains "quotes", (brackets), and the number 42.01.
Mr. E. Smith's [first] name is John—E is for example.
PowerShell is cross-platform.
This sentence isn''t valid
'@

$MyPattern = '(?m)(?<=^\s*|[.?!]\s+)(?>[\(''"/:.]*([A-Z]\.|' +
    '[^.?!;,\s\(\)"/]+)(?<!'')[;,\)''"/]*\s*)+[.?!]+'

[regex]::Matches($Sentences, $MyPattern).ForEach{
    Write-Host ('Sentence: "{0}"' -f $_.Value)
    Write-Host (
        '   Words: {0}{1}' -f ($_.Groups[1].Captures.Value -join '/'),
        [Environment]::NewLine
    )
}
