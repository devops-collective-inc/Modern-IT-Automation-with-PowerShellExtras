$Pattern = 'Service \[\d+\] ready'
Select-String $Pattern -Path $SampleLog -Context 1
