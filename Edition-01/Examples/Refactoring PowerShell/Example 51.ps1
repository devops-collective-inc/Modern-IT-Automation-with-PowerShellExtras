    # Strings
    $ByteArray1 = [System.Text.Encoding]::UTF8.GetBytes('Hello World1')
    $ByteArray2 = [System.Text.Encoding]::UTF8.GetBytes('Hello World2')
    # Note that $ByteArray1 and ByteArray2 are arrays.
    # See: Output1 in 'Output'
    #
    # Output 1:
    $ByteArray1 -join ' '
    $ByteArray2 -join ' '
    # While we can compare strings, for this demo
    # we're assuming we're comparing byte strings.

    # Compare the left
    $LeftDifference = @()
    for ($i = 0; $i -ne $ByteArray1.Count; $i++) {
        if ($ByteArray1[$i] -ne $ByteArray2[$i]) {
            $LeftDifference += [pscustomobject]@{
                Index      = $i
                Pos        = 'left'
                ValueLeft  = $ByteArray1[$i]
                ValueRight = $ByteArray2[$i]
            }
        }
    }

    # Compare the right
    $RightDifference = @()
    for ($i = 0; $i -ne $ByteArray2.Count; $i++) {
        if ($ByteArray1[$i] -ne $ByteArray2[$i]) {
            $RightDifference += [pscustomobject]@{
                Index      = $i
                Pos        = 'right'
                ValueLeft  = $ByteArray1[$i]
                ValueRight = $ByteArray2[$i]
            }
        }
    }

    #
    # Output 2:
    $LeftDifference
    $RightDifference
