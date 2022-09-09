BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
    $title = 'function PowerShellDate '
}
Describe '<title>' {
    It 'Returns <Date> for <Name>' -ForEach @(
        @{Name = 'Windows PowerShell 1.0'; Date = 'Nov 2006'}
    ) {
        Get-PowerShellDate $Name | Should -Be $Date
    }
}
