# Arrange
BeforeAll {
  . $PSCommandPath.Replace('.Complex.Tests.ps1', '.ps1')
}

Describe 'Search-SWFilm' -Tag 'Unit' {
  $itName = "Returns film with release date '<year>' & director " +
  "'<director>' given title fragment '<name>'" 
  It $itName -TestCases @(
    # Arrange
    @{
       name = 'Phantom'
       year = '1999-05-19'
       director = 'George Lucas' 
    }
    @{
       name = 'Empire'
       year = '1980-05-17'
       director = 'Irvin Kershner' 
    }
    @{
       name = 'Return'
       year = '1983-05-25'
       director = 'Richard Marquand' }
  ) {
    # Act
    $result = Search-SWFilm -name $name

    # Assert
    $result.Count | Should -Be 1
    $result.title | Should -BeLike "*$name*"
    $result.release_date | Should -Be $year
    $result.director | Should -Be $director
  }
}

Describe 'Get-SWPerson' -Tag 'Unit' {
  $itName = "Returns person metadata for '<fullname>' with gender " +
  "'<gender>', eye colour '<eyeColour>' & film count of <filmCount>" 
  It $itName -TestCases @(
    # Arrange
    @{
       name = 'maul'
       fullName = 'Darth Maul'
       gender = 'male'
       eyeColour = 'yellow'
       homeWorld = 'Dathomir'
       filmCount = 1 
    }
    @{
       name = 'luke'
       fullName = 'Luke Skywalker'
       gender = 'male'
       eyeColour = 'blue'
       homeWorld = 'Tatooine'
       filmCount = 4 
    }
    @{
       name = 'mothma'
       fullName = 'Mon Mothma'
       gender = 'female'
       eyeColour = 'blue'
       homeWorld = 'Chandrila'
       filmCount = 1 
    }
  ) {
    # Act
    $result = Search-SWPerson -name $name
    $result.Count | Should -Be 1
    $details = Get-SWPerson -Id $result.Id

    # Assert
    $details | Should -Not -BeNullOrEmpty
    $details.Name | Should -Be $fullName
    $details.BodyType.gender | Should -Be $gender
    $details.BodyType.eye_color | Should -Be $eyeColour
    $details.HomeWorld.name | Should -Be $homeWorld
    $details.Films | Should -HaveCount $filmCount 
  }
}