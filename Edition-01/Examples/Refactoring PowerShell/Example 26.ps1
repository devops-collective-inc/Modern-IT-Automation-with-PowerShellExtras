function Extract-File {
    param ([String]$FileName, [String]$ExtractPath)

    $File = Get-Item -LiteralPath $FileName
    $File | Expand-Archive -DestinationPath $ExtractPath

}
