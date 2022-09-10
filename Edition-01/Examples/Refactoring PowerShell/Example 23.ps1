function Process-File {
    param($Filename, $VerifyHashes)

    #
    # Get the File object, expand it, and return an SHA256 hash of the contents

    $File = Get-Item -LiteralPath $Filename
    $ExpandPath = Join-Path ([System.IO.Path]::GetTempPath()) (New-Guid)
    $File | Expand-Archive -DestinationPath $ExpandPath

    $GetChildItemParams = @{
        LiteralPath = $ExpandPath
        File        = $true
        Recurse     = $true
    }

    $Hashes = (Get-ChildItem @GetChildItemParams | Get-FileHash).Hash

    #
    # Perform a comparision on the hashes to ensure

    $CompareObjectParams = @{
        ReferenceObject  = $Hashes
        DifferenceObject = $VerifyHashes
    }

    $Difference = Compare-Object @CompareObjectParams

    if ($Difference.InputObject.Count -ne 0) {

        $MailMessageParams = @{
            To      = 'Helpdesk'
            From    = 'NoReply'
            Subject = 'File Transfer Failed'
        }

        Send-MailMessage @MailMessageParams
        throw "Issue with the hash"

    }

    #
    # Insert 'Test' at the end of each of the files
    Get-ChildItem @GetChildItemParams | Add-Content -Value 'Test'

    return $ExpandPath
}
