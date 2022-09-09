$FilePath = Join-Path $PWD 'demo.xml'
$XMLObject.Save($FilePath)

Get-Item $FilePath
