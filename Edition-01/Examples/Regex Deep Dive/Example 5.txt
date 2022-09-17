^                       # Beginning of string
(?:                     # Noncapturing group
    (?<Octets>              # Capturing group named "Octets"
                            # First alternative, matches 250-255
        25[0-5]                 # Match "25" then 0-5
    |                       #
                            # Second alternative, matches 200-249
        2[0-4][0-9]             # Match "2" then 0-4 then 0-9
    |                       #
                            # Third alternative, matches 0-199
        [01]?                   # Match "1" or "0" optionally
        [0-9]{1,2}              # Match 0-9, 1 or 2 times
    )                       #
    \.                      # Match period/full-stop
){3}                    # Match this group 3 times
                        #
(?<Octets>              #     Exactly the same "Octets" group for 4th octet,
    25[0-5]                 # since .NET regex doesn't support
|                       #     subroutines/recursion
    2[0-4][0-9]             #
|                       #
    [01]?[0-9]{1,2}         #
)                       #
$                       # End of string
