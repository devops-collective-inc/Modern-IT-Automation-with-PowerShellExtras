Describe 'PSversion Check' {
    BeforeAll {
        $FullName = '.\psversiontable.xml'
        $PSVersionTable | Export-Clixml $FullName
    }
    It 'File PSversion Should Not Be Null Or Empty'  {
        Get-Content $FullName | Should -Not -BeNullOrEmpty
    }
    AfterAll {
        Remove-Item -Path $FullName -Force
    }
}
