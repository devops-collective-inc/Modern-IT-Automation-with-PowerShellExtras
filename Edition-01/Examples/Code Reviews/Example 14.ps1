# PSScriptAnalyzerSettings.psd1
@{
    CustomRulePath      = @(
        '.\output\RequiredModules\DscResource.AnalyzerRules'
        '.\tests\QA\AnalyzerRules\SqlServerDsc.AnalyzerRules.psm1'
    )

    IncludeRules        = @('Measure-*')

    IncludeDefaultRules = $true
}
