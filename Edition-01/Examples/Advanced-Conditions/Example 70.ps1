$PSCustomObject = [PSCustomObject]@{
    DateTime = '1/1/2021' -as [DateTime]
    Processes = (Get-Process -Name 'code').id -join ''
    BinaryOperation = -bnot 15 -shl 1; AnotherValue = 4
}
$PSCustomObject
