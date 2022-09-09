function Write-PS5Event {
    param (
        [Parameter(Mandatory = $true)]
        $Message,
        [Parameter(Mandatory = $true)]
        $EventID,
        [Parameter(Mandatory = $true)]
        [ValidateSet('Warning', 'Error', 'Information')]
        $EventLevel
    )

    $SourceName = 'MyPS5Log'
    $ErrorActionPreference = 'Stop'

    # Create the EventLog Source
    if (-not [System.Diagnostics.EventLog]::SourceExists($SourceName)) {
        Write-Verbose (
            'EventSource was missing, attempting to add. This will fail' +
            ' if not running in an elevated PowerShell session'
        )
        New-EventLog -LogName Application -Source $SourceName   
    }

    Write-Verbose $Message
    $EventLogParams = @{
        LogName   = 'Application'
        Source    = $SourceName
        EventID   = $EventID
        EntryType = $EventLevel
        Message   = $Message
        Category  = $EventID
    }
    Write-EventLog @EventLogParams
}
