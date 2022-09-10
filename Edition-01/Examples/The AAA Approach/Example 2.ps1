function Search-SWPerson {
    param (
        [Parameter(Mandatory)]
        [string] $Name
    )
    # load all the people
    $response = Invoke-StarWarsApi -objectType People
    # filter on the name
    $results = $response | Where-Object name -like "*$Name*"

    if ($null -eq $results) {
        Write-Output @{ Error = "No person results found for '$Name'."}
    }
    else {
        # return all matches with some properties
        $personDetails = $results | ForEach-Object { 
            Invoke-StarWarsApi -objectType People -id $_.id 
        }

        Write-Output $personDetails | Select-Object @{ 
            Name = "id";
            Expression = { $_.id} 
        }, name, gender, height,
        @{ 
            Name = "weight"
            Expression = {$_.mass} 
        }
    }
}
