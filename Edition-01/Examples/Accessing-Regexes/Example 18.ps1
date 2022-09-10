$RandomNumber = Get-Random -Minimum 0 -Maximum 500

switch -Regex ($RandomNumber) {
    '\d{3}' { "3-digit number: $_"; break }
    '\d\d'   { "2-digit number: $_"; break }
    default  { "Single-digit number: $_" }
}
