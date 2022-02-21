# Wrapper for the Star Wars API website https://swapi-deno.azurewebsites.net
#
# other samples that are out there, in case the above site goes offline
# - www.swapi.tech
# - swapi.dev

#Requires -Version 7.0

$swApiUrl = 'https://mc-starwars-data.azurewebsites.net'
function Invoke-StarWarsApi
{
    param (
        [Parameter(Mandatory)]
        [ValidateSet('Planets', 'Films', 'People')]
        [string] $objectType,

        [int] $id = -1 
    )
    try {
        $suffix = $id -ne -1 ? "?id=$id" : ""
        $path = "$($objectType.ToLower())$suffix"

        $output = Invoke-RestMethod -Uri "$swApiUrl/api/$path" -Method GET
        Write-Output $output
    }
    catch {
        $msg = "Error calling $swApiUrl/api/$path. $($_.Exception.Message)"
        Write-Host $msg -f Red
        Write-Output $null
    }
}

# Searches for a Star Wars person given a part of a name
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
        $personDetails = $results | ForEach-Object { Invoke-StarWarsApi -objectType People -id $_.id }
        Write-Output $personDetails | Select-Object @{ Name = "id"; Expression = { $_.id} }, 
                                                    name, gender, height, 
                                                    @{ Name = "weight"; Expression = {$_.mass} }
    }
}

# Searches for a Star Wars planet given part of a name
function Search-SWPlanet {
    param (
        [Parameter(Mandatory)]
        [string] $Name
    )
    # load all the planets
    $response = Invoke-StarWarsApi -objectType Planets
    # filter on the name
    $results = $response | Where-Object name -like "*$Name*" 

    if ($null -eq $results) {
        Write-Output @{ Error = "No planet results found for '$Name'."}
    }
    else {
        $planetDetails = $results | ForEach-Object { Invoke-StarWarsApi -objectType Planets -id $_.id }
        # return all matches with some attributes
        Write-Output $planetDetails | Select-Object @{ Name = "id"; Expression = {$_.id} }, 
                                                    name, population, diameter, terrain
    }
}

# Searches for a Star Wars film given part of a name
function Search-SWFilm {
    param (
        [Parameter(Mandatory)]
        [string] $Name
    )
    # load all the films (currently does not include the new trilogy)
    $response = Invoke-StarWarsApi -objectType Films
    # filter on the name
    $results = $response | Where-Object title -like "*$Name*" 

    if ($null -eq $results) {
        Write-Output @{ Error = "No film results found for '$Name'."}
    }
    else {
        # return all matches with some attributes
        $filmDetails = $results | ForEach-Object { Invoke-StarWarsApi -objectType Films -id $_.id }
        Write-Output $filmDetails | Select-Object @{ Name = "id"; Expression = { $_.id} }, 
                                                  title, director, release_date, 
                                                  characters, planets
    }
}

function Get-SWPerson {
    param (
        [Parameter(Mandatory)]
        [int] $Id
    )
    # get the person
    $person = Invoke-StarWarsApi -objectType People -id $Id

    if ($null -ne $person.Error)
    {
        Write-Output @{ Error = "Unable to find a person record given Id: $Id" }
    }
    else {
        # get the homeworld planet and the films
        $planet = Invoke-StarWarsApi -objectType Planets -id $person.homeworld
        $films = Invoke-StarWarsApi -objectType Films

        # get detailed info of all films
        $filmDetails = $films | ForEach-Object { Invoke-StarWarsApi -objectType Films -id $_.id }

        # build the result object as a mix of all the data returned
        $result = [PSCustomObject]@{
            Name = $person.Name
            BodyType = $person | Select-Object height, mass, gender, skin_color, eye_color
            HomeWorld = $planet | Select-Object name, population, gravity, terrain
            Films = $filmDetails | Where-Object people -contains $person.id | Select-Object title, director, release_date
        }
        Write-Output $result
    }
}
