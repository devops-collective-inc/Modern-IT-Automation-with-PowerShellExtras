$Counter = 0
for ($i = 0; $i -ne 10; $i++) {
    for ($x = 0; $x -ne 10; $x++) {
        for ($z = 0; $z -ne 10; $z++) {
            $Counter++
            Write-Host "$Counter"
        }
    }
}
