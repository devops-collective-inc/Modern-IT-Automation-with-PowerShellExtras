    # Define an Output Array
    $AffectedUsers = @()
    # Retrive all the Users from Active Directory
    $Users = Get-ADUser -Filter *
    # Iterate through each of the Users.
    foreach ($user in $Users) {
        # Retrive the group membership for the user
        $UsersGroups = $_ | Get-ADPrincipalGroupMembership
        # Use Where-Object
        [array]$ContainsTest = $UsersGroups | Where-Object {
            $_.DistinguishedName -match 'test'
        }
        if ($ContainsTest.Count -ne 0) { $AffectedUsers += $user }
    }
