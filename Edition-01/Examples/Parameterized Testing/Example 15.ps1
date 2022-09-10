Describe 'PSversion Check' {
    BeforeEach {
        $FullName = '.\psversiontable.xml'
        $PSVersionTable | Export-Clixml $FullName
    }
    It 'File PSversion Should Not Be Null Or Empty'  {
        Get-Content $FullName | Should -Not -BeNullOrEmpty
    }
    AfterEach {
        Remove-Item -Path $FullName -Force
    }
}
