function Update-DataStore {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][string]$Source
    )
    process {
        # Get list of updates from API
        $RequestUri = '{0}/{1}' -f $Source.TrimEnd('/'), 'updates'
        $Updates = (Invoke-RestMethod -Uri $RequestUri).updates.date

        # Determine latest update and parse unix timestamp
        [int64]$Latest = 0
        $Updates.ForEach{ if ($_ -gt $Latest) { $Latest = $_ } }
        $UnixEpoch = [datetime]::new(1970, 1, 1, 0, 0, 0, 0, 1)
        $Update = $UnixEpoch.AddMilliseconds($Latest)

        # Get local data store
        $Store = Get-DataStore -Name $Name

        # Compare updates, and stop if local store is up-to-date
        if ($Update -le $Store.Update) { return }

        # Get data of latest update from API
        $RequestUri = '{0}/{1}/{2}' -f $Source.TrimEnd('/'), 'data', $Latest
        [psobject]$NewData = Invoke-RestMethod $RequestUri

        # Save new data to local store
        Set-DataStore -Name $Name -Data $NewData.data -Update $Update
    }
}
