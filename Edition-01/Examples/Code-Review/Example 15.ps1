#PSScriptAnalyzerSettings.psd1
@{
    IncludeRules = @(
        'PSUseConsistentIndentation'
    )

    Rules = @{
        PSUseConsistentIndentation = @{
            Enable              = $true
            Kind                = 'space'
            PipelineIndentation = 'IncreaseIndentationForFirstPipeline'
            IndentationSize     = 4
        }
    }
}
