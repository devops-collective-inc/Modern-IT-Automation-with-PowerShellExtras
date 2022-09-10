BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Get-PowerShellDate' {
    It 'Returns <Date> for <Name>' -ForEach @(
        @{Name = 'Windows PowerShell 1.0'; Date = 'Nov 2006'}
        @{Name = 'Windows PowerShell 2.0'; Date = 'Jul 2009'}
        @{Name = 'Windows PowerShell 3.0'; Date = 'Oct 2012'}
        @{Name = 'Windows PowerShell 4.0'; Date = 'Oct 2013'}
        @{Name = 'Windows PowerShell 5.0'; Date = 'Feb 2016'}
        @{Name = 'Windows PowerShell 5.1'; Date = 'Aug 2016'}
        @{Name = 'PowerShell Core 6.0';    Date = 'Jan 2018'}
        @{Name = 'PowerShell Core 6.1';    Date = 'Sep 2018'}
        @{Name = 'PowerShell Core 6.2';    Date = 'Mar 2019'}
        @{Name = 'PowerShell Core 7.0';    Date = 'Mar 2020'}
        @{Name = 'PowerShell Core 7.1';    Date = 'Nov 2020'}
    ) {
        Get-PowerShellDate $Name | Should -Be $Date
    }
}
