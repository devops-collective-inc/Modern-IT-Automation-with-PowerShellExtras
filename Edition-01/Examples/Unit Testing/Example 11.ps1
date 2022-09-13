$Config = New-PesterConfiguration
$Config.Run.PassThru = $true
$Config.Run.Path = './scripts/build'
$Config.Filter.Tag = 'Unit', 'Integration'
$Config.Output.Verbosity = 'Detailed'

$Results = Invoke-Pester -Configuration $Config
