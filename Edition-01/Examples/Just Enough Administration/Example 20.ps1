# Step 1: Create the owner

# Alternatively use an SID
# $Owner = [System.Security.Principal.SecurityIdentifier]::new
#                       ('S-1-5-21-2274662803-2033504868-1650952085-500')

# In this case we will use a prefedined trustee
# NS being the SID string constant for 'Network Security'
$Owner = [System.Security.Principal.SecurityIdentifier]::new("NS")

# Step 2: Primary group
# BA being the SID string constant for 'Built-in Administrators'
$PrimaryGroup = [System.Security.Principal.SecurityIdentifier]::new("BA")

# Step 3: Create the Discretionary ACL
$DiscretionaryACL = [System.Security.AccessControl.RawAcl]::new(0,0)

# Step 4: Create ACE
$EveroneAllowedACE = [System.Security.AccessControl.ObjectAce]::new(
    [System.Security.AccessControl.AceFlags]::None,
    [System.Security.AccessControl.AceQualifier]::AccessAllowed,
    1,
    # 'WD' is an SID string constant for 'Everyone'
    [System.Security.Principal.SecurityIdentifier]::new('WD'),
    [System.Security.AccessControl.ObjectAceFlags]::None,
    [System.Guid]::NewGuid(),
    [System.Guid]::NewGuid(),
    $false,
    $null
)

# Step 5: Add the ACE into the ACL
$index = 0

# Add to the ACL
$DiscretionaryACL.InsertAce($index, $EveroneAllowedACE)

# Step 6: Create the System ACL
$SystemACL = [System.Security.AccessControl.RawAcl]::new(0,0)

# Step 7: Create an ACE for SystemACL
$EveroneAuditACE = [System.Security.AccessControl.ObjectAce]::new(
    [System.Security.AccessControl.AceFlags]::SuccessfulAccess,
    [System.Security.AccessControl.AceQualifier]::SystemAudit,
    1,
    # 'WD' is an SID string constant for 'Everyone'
    [System.Security.Principal.SecurityIdentifier]::new('WD'),
    [System.Security.AccessControl.ObjectAceFlags]::None,
    [System.Guid]::NewGuid(),
    [System.Guid]::NewGuid(),
    $false,
    $null
)

# Step 8: Add ACE into SystemACL
$index = 0

# Add to the ACL
$SystemACL.InsertAce($index, $EveroneAuditACE)

# Step 9: Define the control flags for the security descriptor

# Within PowerShell remoting we will set the Protected flag ('P') for
# the SystemACL and DiscretionaryACL
$ControlFlags = [System.Security.AccessControl.ControlFlags]

$Flags = @(
    $ControlFlags::DiscretionaryAclPresent
    $ControlFlags::SystemAclPresent
    $ControlFlags::DiscretionaryAclProtected
    $ControlFlags::SystemAclProtected
    $ControlFlags::SelfRelative
)

# Step 10: Create the security descriptor and
# convert the object to the SDDL format.
$SecurityDescriptor =
    [System.Security.AccessControl.RawSecurityDescriptor]::new(
        $Flags, $Owner, $PrimaryGroup, $SystemACL,$DiscretionaryACL
    )
$SecurityDescriptor.GetSddlForm(
    [System.Security.AccessControl.AccessControlSections]::All
)
