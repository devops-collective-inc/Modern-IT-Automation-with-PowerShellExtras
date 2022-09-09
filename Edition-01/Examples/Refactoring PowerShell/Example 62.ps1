# Test if the Paths Exist. If not, return to the caller
if (-not ('SomeCSVPath', 'SomeCLIXMLPath', 'SomeOtherCLIXMLPath' | Test-Path)) {
    return
}

# Import the CSV File
$CSVFile = Import-Csv -LiteralPath 'SomeCSVPath'

# Invert $someCondition
if (-not ($someCondition)) {
    throw "Condition Failed. Stopping"
}

<#
We can use splatting to simplify the output here.
Multiple examples are used to demonstrate different
means of refactoring the code. These are:

1. Standard Execution (used in the example)
2. Subexpression (shown below)
3. Ternary operator (shown below)

#>
$Params = @{
    LiteralPath = 'SomeCLIXMLPath'
}

# Standard Execution
if (-not ($anotherCondition)) { $Params.LiteralPath = 'SomeOtherCLIXMLPath' }

# Splat it in!
Import-Clixml @Params
