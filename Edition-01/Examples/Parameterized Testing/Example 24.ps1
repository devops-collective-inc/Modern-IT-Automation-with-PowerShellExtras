$ResultData = $ResultPester.Tests |
    Select-Object ExpandedName, Result, { $_.ErrorRecord },
    Block, ExecutedAt, Duration

$ResultData | Export-Excel -Path .\test.xlsx -ConditionalText $(
    $TextPARAMs = @{
        Text                 = 'Passed'
        Range                = 'B:B'
        BackgroundColor      = 'Green'
        ConditionalTextColor = 'White'
    }
    New-ConditionalText @TextPARAMs
    $TextPARAMs2 = @{
        Text                 = 'Failed'
        Range                = 'B:B'
        BackgroundColor      = 'Red'
        ConditionalTextColor = 'White'
    }
    New-ConditionalText @TextPARAMs2
)
