function Get-PowerShellDate {
    $VersionList = @{
        'Windows PowerShell 1.0' = 'Nov 2006'
        'Windows PowerShell 2.0' = 'Jul 2009'
        'Windows PowerShell 3.0' = 'Oct 2012'
        'Windows PowerShell 4.0' = 'Oct 2013'
        'Windows PowerShell 5.0' = 'Feb 2016'
        'Windows PowerShell 5.1' = 'Aug 2016'
        'PowerShell Core 6.0'  = 'Jan 2018'
        'PowerShell Core 6.1'  = 'Sep 2018'
        'PowerShell Core 6.2'  = 'Mar 2019'
        'PowerShell Core 7.0'  = 'Mar 2020'
        'PowerShell Core 7.1'  = 'Nov 2020'
    }
    return $VersionList[$args]
}
