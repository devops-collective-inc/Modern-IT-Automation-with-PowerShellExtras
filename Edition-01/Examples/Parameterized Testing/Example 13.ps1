BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}
BeforeDiscovery {
    $title = 'function PowerShellDate '
    $HList = [System.Collections.Generic.List[Hashtable]]::new()
    $HList.Add(@{Name = 'Windows PowerShell 1.0'; Date = 'Nov 2006'})
    $HList.Add(@{Name = 'Windows PowerShell 2.0'; Date = 'Jul 2009'})
    $HList.Add(@{Name = 'Windows PowerShell 3.0'; Date = 'Oct 2012'})
    $HList.Add(@{Name = 'Windows PowerShell 4.0'; Date = 'Oct 2013'})
    $HList.Add(@{Name = 'Windows PowerShell 5.0'; Date = 'Feb 2016'})
    $HList.Add(@{Name = 'Windows PowerShell 5.1'; Date = 'Aug 2016'})
    $HList.Add(@{Name = 'PowerShell Core 6.0';    Date = 'Jan 2018'})
    $HList.Add(@{Name = 'PowerShell Core 6.1';    Date = 'Sep 2018'})
    $HList.Add(@{Name = 'PowerShell Core 6.2';    Date = 'Mar 2019'})
    $HList.Add(@{Name = 'PowerShell Core 7.0';    Date = 'Mar 2020'})
    $HList.Add(@{Name = 'PowerShell Core 7.1';    Date = 'Nov 2020'})
}
Describe "$title" {
    It 'Returns <Date> for <Name>' -ForEach $HList {
        Get-PowerShellDate $Name | Should -Be $Date
    }
}
