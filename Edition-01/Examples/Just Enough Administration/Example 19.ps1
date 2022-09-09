$SecurityDescriptor =
    [System.Security.AccessControl.RawSecurityDescriptor]::new(
        'SDDL STRING'
    )
# Make adjustments

# Export back into SDDL string format
$SecurityDescriptor.GetSddlForm(
    [System.Security.AccessControl.AccessControlSections]::All
)
