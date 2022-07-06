BeforeAll {
    . (Join-Path (Split-Path $PSCommandPath) 'DataStoreFunctions.ps1')
}

Describe "Mocking native applications" {

    BeforeAll {
        $MockFile = 'HelloGround.txt'
        Mock tar {
            $fileArg = -1
            for ($i = 0; $i -lt $args.Count; $i++) {
                if ($args[$i] -match '-\w*f') {
                    $fileArg = $i + 1
                    break
                }
            }
            if ($fileArg -lt 0) { throw 'No archive file passed' }
            $FilePath = (Join-Path 'TestDrive:' $MockFile)
            Set-Content $FilePath 'Oh no, not again'
            if (($args -match '-\w*v').Count -gt 0) {
                return "x $MockFile"
            }
        } -ParameterFilter {
            ($args -like '-x*').Count -gt 0
        }

        Mock tar {
            return $MockFile
        } -ParameterFilter {
            ($args -like '-t*').Count -gt 0
        }
    }

    It "Lists mock archive" {
        tar -tf test.zip | Should -Be $MockFile
    }

    It "Extracts mock file" {
        tar -xvf test.zip | Should -be "x $MockFile"
        $File = Join-Path 'TestDrive:' $MockFile
        $File | Should -Exist
        $File | Should -FileContentMatch 'Oh no, not again'
    }

    It "Only calls tar in list or extract mode" {
        Should -Invoke tar -Exactly 2 -ExclusiveFilter {
            ($args -like '-t*').Count -gt 0 -or
            ($args -like '-x*').Count -gt 0
        } -Scope Describe
    }
}
