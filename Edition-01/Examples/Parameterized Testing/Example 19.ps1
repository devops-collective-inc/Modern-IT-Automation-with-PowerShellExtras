$PesterconfigDiag = [PesterConfiguration]::Default
$PesterconfigDiag.Output.Verbosity = 'Diagnostic'
$PesterconfigDiag.Run.Container = $container
Invoke-Pester -Configuration $PesterconfigDiag
