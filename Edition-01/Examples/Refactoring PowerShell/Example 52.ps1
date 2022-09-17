    # Strings
    $ByteArray1 = [System.Text.Encoding]::UTF8.GetBytes('Hello World1')
    $ByteArray2 = [System.Text.Encoding]::UTF8.GetBytes('Hello World2')
    # While we can compare strings, for this demo
    # we're assuming we're comparing byte strings.

    Compare-Object -ReferenceObject $ByteArray1 -DifferenceObject $ByteArray2
