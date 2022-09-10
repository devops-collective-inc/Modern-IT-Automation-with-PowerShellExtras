BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Get-PowerShellDate' {
    It 'Returns Nov 2006' {
        Get-PowerShellDate 'Windows PowerShell 1.0' | Should -Be 'Nov 2006'
    }
}
