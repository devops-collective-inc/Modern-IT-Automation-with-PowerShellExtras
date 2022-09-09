# Test the files to make sure that they exist
if ('SomeCSVPath', 'SomeCLIXMLPath', 'SomeOtherCLIXMLPath' | Test-Path) {
    # Import the File
    $CSVFile = Import-Csv -LiteralPath 'SomeCSVPath'
    # Import the CLIXML
    if ($someCondition) {
        if ($anotherCondition) {
            $CLIXML = Import-Clixml -LiteralPath 'SomeCLIXMLPath'
        }
        else {
            $CLIXML = Import-Clixml -LiteralPath 'SomeOtherCLIXMLPath'
        }
        Write-Host "Completed!"
        Write-Output $CLIXML
    }
    else {
        throw "Condition Failed. Stopping"
    }
}
