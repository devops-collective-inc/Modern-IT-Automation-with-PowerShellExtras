function New-AzureSQLServer {
    param (
        [Parameter(Mandatory = $false)]
        [String]$RGName = 'MyApp',

        [Parameter(Mandatory = $false)]
        [String]$ServerName = 'myuniquesqlserver956x',

        [Parameter(Mandatory = $false)]
        [String]$DbName = 'mydb',

        [Parameter(Mandatory = $false)]
        [String]$Location = 'AustraliaEast',

        [Parameter(Mandatory = $false)]
        [String]$StartIP = '0.0.0.0',

        [Parameter(Mandatory = $false)]
        [String]$EndIP = '0.0.0.0',

        [Parameter(Mandatory = $false)]
        [String]$User = 'sqladmin',

        [Parameter(Mandatory = $false)]
        [String]$Password = 'MyC0mplexP@ssWord!'
    )

    ## Create Resource Group if it doesn't exist
    if (-not (Get-AzResourceGroup -Name $RGName -ea:si)) {
        $Rg = New-AzResourceGroup -Name $RGName -Location $Location
    }

    ## Create a username and password for the SQL server.
    ## You wouldn't have credentials in your code.
    ## This is for demonstration purposes only.
    $Pw = ConvertTo-SecureString $Password -AsPlainText -Force
    $Cred = New-Object PSCredential $User, $Pw

    ## Create SQL Server
    $SqlParams = @{
        ResourceGroupName           = $RGName
        ServerName                  = $ServerName
        Location                    = $Location
        SqlAdministratorCredentials = $Cred
    }

    $Server = New-AzSqlServer @SqlParams

    ## Create firewall rule allowing access from the specified IP range
    $FwRuleParams = @{
        ResourceGroupName = $RGName
        ServerName        = $ServerName
        FirewallRuleName  = 'AllowedIPs'
        StartIpAddress    = $StartIP
        EndIpAddress      = $EndIP
    }

    $ServerFirewallRule = New-AzSqlServerFirewallRule @FwRuleParams

    ## Create a blank database with an S0 performance level
    $DbParams = @{
        ResourceGroupName             = $RGName
        ServerName                    = $ServerName
        DatabaseName                  = $DbName
        RequestedServiceObjectiveName = 'S0'
        SampleName                    = 'AdventureWorksLT'
    }

    $Database = New-AzSqlDatabase @DbParams

    ## Return database connection string
    $ConnectionString = @(
        "Server=tcp:$ServerName.database.windows.net,1433;",
        "Database=$DbName;",
        "User ID=$User;",
        "Password=$Password;",
        "Trusted_Connection=False;",
        "Encrypt=True;"
    )

    return $ConnectionString

}
