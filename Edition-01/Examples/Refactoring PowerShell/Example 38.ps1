function Test-FileContents {
    param([String]$LiteralPath)

    $Content = Get-Content -LiteralPath $LiteralPath -Raw
    if ($Content.Length -eq 0) { return $false }
    $Content
}
