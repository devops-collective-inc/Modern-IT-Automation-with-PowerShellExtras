# With Expressions:

# Value contains white space on each side
$value = ' value '
switch ($value) {
    # Trim both the start and ending white space and perform a match
    { $_.Trim() -eq 'value' } {
        'This matches'
    }
    # Perform string manipulation and test
    { ($value.Substring(3) -replace 'PowerShell') -eq $_ } {
        'This does not match'
    }
    # This condition is always $true
    { $true } {
        'This also matches'
    }
    # This one is always $false
    { $false } {
        'This does not match'
    }
    # This one is always $false, too
    { $null } {
        'This does not match'
    }
}
