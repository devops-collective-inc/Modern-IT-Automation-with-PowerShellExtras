#
# Example Function
function Invoke-Something {
    param(
        # Add the first attribute
        [ValidateScript({
            # Note! There's PowerShell Code in here!
            Test-Path -Path $_
        })]
        # Add the second one (executed first)
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )
    $Path
}
#
# Example 1: Parse $null into the Parameter
Invoke-Something -Path $null
#
# Example 2: Parse a Valid Path
Invoke-Something -Path "$PSHOME"
#
# Example 3: Parse an invalid Path
Invoke-Something -Path '\:BadPath?'
