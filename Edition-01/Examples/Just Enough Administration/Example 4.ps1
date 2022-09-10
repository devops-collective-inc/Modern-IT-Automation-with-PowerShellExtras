$configSettings = @{

    # Sample Properties. These are incomplete.
    Path = '.\SampleFile.pssc'
    SchemaVersion = '1.0.0.0'
    Author = 'User01'
    Copyright = '(c) Fabrikam Corporation. All rights reserved.'
    CompanyName = 'Fabrikam Corporation'

    # This is the role definitions.
    RoleDefinitions = @{
        # Define the group and then role capability files.
        # *Note that this is an array, so multiple files can be parsed.*
        'CONTOSO\PSSC_HELPDESK_RAS01' = @{
            RoleCapabilityFiles = '.\ServiceMaintenance.psrc',
                                  '.\ProcessMaintenance.psrc'
        }
    }
}

New-PSSessionConfigurationFile @configSettings
