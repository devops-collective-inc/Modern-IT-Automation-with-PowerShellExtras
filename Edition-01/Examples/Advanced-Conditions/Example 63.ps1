# Define the Loop Label to be loopLabel
# This top-level loop will count from 0 to 5.
$Counter = 0
:loopLabel do {
    # Nest a secondary loop within the first.
    # This loop will count from 0 to 10.
    for ($i=0; $i -ne 10; $i++) {

        # If the counter reaches 3, we will exit the nested loop
        # and continue within the parent loop.
        if ($i -eq 3) {
            # Specify the target label for the continue statement.
            continue :loopLabel
        }

        Write-Host "Top Level Counter: $Counter Nested Counter: $i"

    }

    $Counter++

} until ($Counter -eq 5)
