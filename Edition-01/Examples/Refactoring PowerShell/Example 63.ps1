function Invoke-Something {
    param($FilePath)

    #
    # If the File Extension is an '.exe'
    # Then return true.
    if ((Get-Item $FilePath).Extension -eq '.exe') { return $true }

    #
    # Load the file
    $Content = Get-Content $FilePath

    # If the first line of the file contains 'Value'
    # Then return true.
    if ($Content[0] -eq 'Value') { return $true }

    # If the last line of the file contains 'EndOfFile'
    # Then return true.
    if ($Content[-1] -eq 'EndOfFile') { return $true }

    # Return false
    return $false
}
