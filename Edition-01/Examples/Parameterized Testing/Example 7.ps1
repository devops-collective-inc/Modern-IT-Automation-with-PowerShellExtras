BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
Describe 'Get-PowerShellDate' {
    It 'Returns Nov 2006' {
        Get-PowerShellDate 'Windows PowerShell 1.0' | Should -Be 'Nov 2006'
    }
    It 'Returns Jul 2009' {
        Get-PowerShellDate 'Windows PowerShell 2.0' | Should -Be 'Jul 2009'
    }
    It 'Returns Oct 2012' {
        Get-PowerShellDate 'Windows PowerShell 3.0' | Should -Be 'Oct 2012'
    }
    It 'Returns Oct 2013' {
        Get-PowerShellDate 'Windows PowerShell 4.0' | Should -Be 'Oct 2013'
    }
    It 'Returns Feb 2016' {
        Get-PowerShellDate 'Windows PowerShell 5.0' | Should -Be 'Feb 2016'
    }
    It 'Returns Aug 2016' {
        Get-PowerShellDate 'Windows PowerShell 5.1' | Should -Be 'Aug 2016'
    }
    It 'Returns Jan 2018' {
        Get-PowerShellDate 'PowerShell Core 6.0' | Should -Be 'Jan 2018'
    }
    It 'Returns Sep 2018' {
        Get-PowerShellDate 'PowerShell Core 6.1' | Should -Be 'Sep 2018'
    }
    It 'Returns Mar 2019' {
        Get-PowerShellDate 'PowerShell Core 6.2' | Should -Be 'Mar 2019'
    }
    It 'Returns Mar 2020' {
        Get-PowerShellDate 'PowerShell Core 7.0' | Should -Be 'Mar 2020'
    }
    It 'Returns Nov 2020' {
        Get-PowerShellDate 'PowerShell Core 7.1' | Should -Be 'Nov 2020'
    }
}
