function Import-FileasXML {
    param([String]$LiteralPath)

    $Content = Get-Content -LiteralPath $LiteralPath

    try {
        $Content = [XML]$Content
    } catch {}

    $Content
}
