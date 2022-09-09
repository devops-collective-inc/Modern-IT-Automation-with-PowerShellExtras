param (
    [Parameter(Mandatory)]
    [string[]]$FullNameList
)

BeforeDiscovery {
    $HList = [System.Collections.Generic.List[hashtable]]::new()
    foreach ($FullName in $FullNameList) {
        $FileContent = Get-Content -Path $FullName
        $FileName = Split-Path $FullName -Leaf
        $L = 0
        $FileContent.ForEach{
            $L++
            $HList.Add(@{
                FileName    = $FileName
                LineNumber  = $L
                LineLength  = $PSItem.Length
                LineContent = $PSItem
            })
        }
    }
}

Describe 'FileContent' -ForEach $HList {
    Context 'Line <LineNumber> from <FileName>' {
        It 'Line <LineNumber> Should be less than 100 char' {
            $PSItem.Length | Should -BeLessThan 100
        }
        It "Line '<LineContent>' Should Match 'o'" {
            $PSItem.LineContent | Should -Match 'o'
        }
    }
}
