param (
    [Parameter(Mandatory)]
    [string] $FullName
)

BeforeDiscovery {
    $FileContent = Get-Content -Path $FullName
    $HList = [System.Collections.Generic.List[hashtable]]::new()
    $L = 0
    $FileContent.ForEach{
        $L++
        $HList.Add(@{
            LineNumber  = $L
            LineLength  = $PSItem.Length
            LineContent = $PSItem
        })
    }
}

Describe 'FileContent' -ForEach $HList {
    Context 'Line <LineNumber>' {
        It 'Line <LineNumber> Should be less than 100 char' {
            $PSItem.Length | Should -BeLessThan 100
        }
        It "Line '<LineContent>' Should Match 'o'" {
            $PSItem.LineContent | Should -Match 'o'
        }
    }
}
