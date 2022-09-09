# Arrange
BeforeAll {
    . $PSCommandPath.Replace('.Complex.Tests.ps1','.ps1')
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
            director = 'Richard Marquand'
        }
    )  {
        # Act
        $result = Search-SWFilm -name $name

        # Assert
        $result.Count | Should -Be 1
        $result.title | Should -BeLike "*$name*"
        $result.release_date | Should -Be $year
        $result.director | Should -Be $director
    }
}
