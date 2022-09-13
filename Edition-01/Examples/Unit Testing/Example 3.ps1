function Invoke-Addition {
    param (
        [Parameter(Mandatory)]
        [ValidateCount(1, 20)]
        [int[]]$Numbers
    )

    $Result = 0
    $Numbers.ForEach{ $Result += $_ }

    $Result
}

function Invoke-Subtraction {
    param (
        [Parameter(Mandatory)]
        [ValidateCount(2, 20)]
        [int[]]$Numbers
    )

    $Result = $Numbers[0]
    $Numbers | Select-Object -Skip 1 | ForEach-Object { $Result -= $_ }

    $Result
}
