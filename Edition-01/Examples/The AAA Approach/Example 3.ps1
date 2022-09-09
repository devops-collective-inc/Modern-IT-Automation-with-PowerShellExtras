function Get-SWPerson {
    param (
        [Parameter(Mandatory)]
        [int] $Id
    )
    # get the person
    $person = Invoke-StarWarsApi -objectType People -id $Id

    if ($null -eq $person)
    {
        Write-Output @{ 
            Error = "Unable to find a person record given Id: $Id" 
        }
    }
    else {
        # get the homeworld planet and the films
        $planet = Invoke-StarWarsApi -objectType Planets -id $person.homeworld
        $films = Invoke-StarWarsApi -objectType Films

        # get detailed info of all films
        $filmDetails = $films | ForEach-Object { 
            Invoke-StarWarsApi -objectType Films -id $_.id
        }

        # build the result object as a mix of all the data returned
        $result = [PSCustomObject]@{
            Name = $person.Name
            BodyType = $person | 
                Select-Object height, mass, gender, skin_color, eye_color
            HomeWorld = $planet |
                Select-Object name, population, gravity, terrain
            Films = $filmDetails | 
                Where-Object people -contains $person.id |
                Select-Object title, director, release_date
        }
        Write-Output $result
    }
}
