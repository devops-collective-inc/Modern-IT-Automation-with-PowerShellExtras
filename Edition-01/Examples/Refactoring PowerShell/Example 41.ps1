function Import-FileasXML {
    param([String]$LiteralPath)

    $Content = Get-Content -LiteralPath $LiteralPath

    [PSCustomObject]@{
        Content    = $Content
        XMLContent = try { [XML]$Content } catch { $null }
    }
}
