$MockSpan = New-MockObject -Type timespan -Methods @{
    Test = {
        param ($Value)
        $Value
    }
} -MethodHistoryPrefix '##'

$MockSpan.Test('Allons-y, Alonzo!')

$MockSpan.'##Test'
