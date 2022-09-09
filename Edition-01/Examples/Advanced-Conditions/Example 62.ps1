# Define the Loop Label to be 'loopLabel'
# This parent do-loop will loop forever by default.
:loopLabel do {
    # Nested for-loop within the do-loop
    # This loop will count from 0 to 10.
    for ($i=0; $i -ne 10; $i++) {

        # If the counter reaches 3, we will break (exit) the parent do-loop.
        if ($i -eq 3) {
            # Specify the target label for the break statement.
            break :loopLabel
        }

        Write-Host "Nested Counter: $i"

    }

} until ($true)

