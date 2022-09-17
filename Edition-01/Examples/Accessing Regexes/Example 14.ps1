$FilteredLog = 'SampleLog-Errors-2021-Q1.log'
$Pattern = '^\[2021-0[1-3].+? \[ERROR\]'
Select-String $Pattern -Path $SampleLog -Raw | Set-Content $FilteredLog

Get-Content $FilteredLog
