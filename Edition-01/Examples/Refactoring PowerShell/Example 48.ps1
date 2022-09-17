    $Computers = Get-ADComputer -Filter *
    $Params = @{
        ComputerName = $Computers
        ScriptBlock  = {
            Write-Host 'Hello-World'
        }
        AsJob        = $true
    }
    Invoke-Command @Params | Wait-Job
