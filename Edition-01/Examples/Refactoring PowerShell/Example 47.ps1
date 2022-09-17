    $Computers = Get-ADComputer -Filter *
    foreach ($Computer in $Computers) {
        $params = @{
            ComputerName = $Computer
            ScriptBlock  = { Write-Host "Hello World" }
        }
        Invoke-Command @params
    }
