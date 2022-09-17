$array = 1,2,3,4,5

:loopLabel foreach ($item in $array) {
    for ($i=0; $i -ne 10; $i++) {

        # If the counter reaches 3, we will break (exit) the loop,
        # On the parent loop.
        if ($i -eq 3) {
            # Define the loop label by appending the label after
            # the break statement.
            break :loopLabel
        }

        Write-Host "Top Level Counter: $item Nested Counter: $i"

    }
}
