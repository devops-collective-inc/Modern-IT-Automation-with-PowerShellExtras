$PesterconfigDiag = [PesterConfiguration]::Default
$PesterconfigDiag.TestResult.OutputFormat = 'JUnitXml'
$PesterconfigDiag.TestResult.Enabled = $true
$PesterconfigDiag.Run.Container = $container
Invoke-Pester -Configuration $PesterconfigDiag

Get-ChildItem -Path *.xml -Name
