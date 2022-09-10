#
# Example Function
function Invoke-Something {
    param(
        # First Script Block
        [ValidateScript({
            Write-Host 'First'
            $_ -ne 'D:\Temp'
        })]
        # Second Script Block
        [ValidateScript({
            Write-Host 'Second'
            $_ -ne 'Z:\Temp'
        })]
        # Thrid Script Block
        [ValidateScript({
            Write-Host 'Third'
            Test-Path -Path $_ -IsValid
        })]
        [string]$Path
    )
    $Path
}
#
# Parse a valid path
Invoke-Something -Path $PSHOME
