function Extract-File {
    param ($FileName, $ExtractPath)

    $File = Get-Item -LiteralPath $FileName
    $File | Expand-Archive -DestinationPath $ExtractPath

}
