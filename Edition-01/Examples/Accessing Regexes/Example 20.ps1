$PesterSample = 'PesterExample.ps1'
@'
Describe "Regex in Pester" {
    It "Matches the pattern" {
        'The sky is Blue.' | Should -Match 'sky\b.+\bblue'
    }
    It "Won't match due to capitals" {
        'The sky is Blue.' | Should -MatchExactly 'sky\b.+\bblue'
    }
}
'@ | Out-File $PesterSample

Invoke-Pester $PesterSample -Output Detailed
