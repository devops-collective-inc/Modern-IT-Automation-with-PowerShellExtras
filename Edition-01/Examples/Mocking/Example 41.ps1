Describe 'Mocking native applications' {

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

}
