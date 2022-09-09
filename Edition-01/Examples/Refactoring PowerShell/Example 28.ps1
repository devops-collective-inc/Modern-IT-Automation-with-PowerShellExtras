function Invoke-Something {
    # Set the CmdletBinding Attribute and Set the Default Parameter Set Name
    [CmdletBinding(DefaultParameterSetName = 'P1')]
    param(
        # Define the Parameter and the ParameterSetName
        [Parameter(ParameterSetName = 'P1')]
        [string]$Parameter1
    )
}
