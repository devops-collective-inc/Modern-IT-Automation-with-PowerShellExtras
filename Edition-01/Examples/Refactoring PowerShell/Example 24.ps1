#
# The First Function to Expand the File
function Extract-File {
    param ($Filename)

    $File = Get-Item -LiteralPath $Filename
    $ExpandPath = Join-Path ([System.IO.Path]::GetTempPath()) (New-Guid)
    $File | Expand-Archive -DestinationPath $ExpandPath

    return $ExpandPath
}

#
# The Second Function to Test Exported Files
function Test-ExportedFiles {
    param($LiteralPath, $VerifyHashes)

    $GetChildItemParams = @{
        LiteralPath = $LiteralPath
        File        = $true
        Recurse     = $true
    }

    $CompareObjectParams = @{
        ReferenceObject  = $(Get-ChildItem @GetChildItemParams |
            Get-FileHash).Hash
        DifferenceObject = $VerifyHashes
    }

    $Difference = Compare-Object @CompareObjectParams

    if ($Difference.InputObject.Count -ne 0) { return $false }
    
    $true

}

#
# The third to Append the string to the end of the file.
function Add-StringToEndOfFile {
    param($FilePath, $Value)

    Get-ChildItem $FilePath -File -Recurse | Add-Content -Value $Value

}

#
# The Final to join them together.
function Process-File {
    param($Filename, $VerifyHashes)

    # Extract the File to C:\Windows
    $ExpandPath = Extract-File -Filename $Filename

    # Test the files
    $Params = @{
        LiteralPath = $ExpandPath
        VerifyHash  = $VerifyHashes
    }

    if (-not (Test-ExportedFiles @Params)) {

        $MailMessageParams = @{
            To      = 'Helpdesk'
            From    = 'NoReply'
            Subject = 'File Transfer Failed'
        }

        Send-MailMessage @MailMessageParams
        throw "Issue with the hash"
    }

    #
    # Add Test to the end of every file.
    Add-StringToEndOfFile -FilePath $ExpandPath -Value 'Test'

    return $ExpandPath
}
