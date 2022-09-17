    # Define an Output Array
    $AffectedUsers = @()
    # Retrive all the Users from Active Directory
    $Users = Get-ADUser -Filter *
    # Iterate through each of the Users.
    foreach ($user in $Users) {
        # Retrive the group membership for the user
        $UsersGroups = $_ | Get-ADPrincipalGroupMembership
        # Set ContainsTest to be implicitly false
        $ContainsTest = $false
        foreach ($userGroup in $UsersGroups) {
            if ($userGroup.DistinguishedName -match 'test') {
                # It contains test
                $ContainsTest = $true
                # Stop processing
                break
            }
        }
        if ($ContainsTest) { $AffectedUsers += $user }
    }
