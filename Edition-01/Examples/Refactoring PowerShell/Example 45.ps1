$Counter = 0
for ($i = 0; $i -ne 10; $i++) {
    for ($x = 0; $x -ne 10; $x++) {
        $Counter++
        Write-Host "$Counter"
    }
}
