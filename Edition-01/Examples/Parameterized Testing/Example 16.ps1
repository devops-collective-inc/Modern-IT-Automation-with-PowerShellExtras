param (
    [Parameter(Mandatory)]
    [ValidateScript({Test-Path $_})]
    [string] $ImportPath
)
BeforeAll {
    $PSVersionTableContent = Import-Clixml $ImportPath
    $PSversion = $($PSVersionTableContent.PSVersion.ToString())
}
Describe 'Current PSVersionTable' {
    It 'Current PSversion should be <PSVersionTableContent.PSVersion>'  {
        $PSVersionTable.PSVersion | Should -Match $PSversion
    }
}
