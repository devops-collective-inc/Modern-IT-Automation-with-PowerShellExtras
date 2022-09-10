function Get-DataStore {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [string]$Name
    )
    process {
        # Determine valid store filename and check it exists
        $StoreFile = Get-DataStoreFile -Name $Name -MustExist

        # If it doesn't, stop
        if (-not $? -or $null -eq $StoreFile) { return }

        # Import CLIXML data from store
        $Data = Import-Clixml -LiteralPath $StoreFile.FullName

        # Return rich store object with name and file time
        [pscustomobject]@{
            Update = $StoreFile.LastWriteTimeUtc
            Data   = $Data
            Name   = $Name
        }
    }
}
