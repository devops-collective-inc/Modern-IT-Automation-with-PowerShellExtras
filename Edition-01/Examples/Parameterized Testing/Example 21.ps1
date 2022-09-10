param (
    [Parameter(Mandatory)]
    [ValidateScript({Test-Path $_})]
    [string] $ImportPath
)
$PSVersionTableContent = Import-Clixml $ImportPath
$PSversion = $($PSVersionTableContent.PSVersion.ToString())
Describe 'Current PSVersionTable' {
    It "Current PSversion should be $($PSVersionTableContent.PSVersion)" {
        $PSVersionTable.PSVersion | Should Be $PSversion
    }
}
