# PSScriptAnalyzerSettings.psd1
@{
    # Import 2 custom rules modules
    CustomRulePath = @(
        '.\output\RequiredModules\DscResource.AnalyzerRules'
        '.\tests\QA\AnalyzerRules\SqlServerDsc.AnalyzerRules.psm1'
    )

    # Include the custom rules
    IncludeRules   = @('Measure-*')
}
