Describe 'Mocking in modules' {

    It 'Throws an error because real private function called' {
        { Get-DataStore -Name SomeName } | Should -Throw
    }

}
