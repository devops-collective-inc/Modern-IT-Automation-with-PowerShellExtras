## Import all modules in current directory
foreach ($Module in Get-ChildItem $PSScriptRoot -Filter '*.psm1') {
    Import-Module -Name $Module.FullName
}

## Create SQL Server and store connection string
$ConnectionString = New-AzureSQLServer
$ConnectionString = -join $ConnectionString

## Create Storage Account
$StorageAccountName = New-AzureStorageAccount

## Create Load Balancer and store public ip address
$Pip = New-AzureLoadBalancer

## Create Virtual Machine(s)
$VMParams = @{
    ConnectionString   = $ConnectionString
    StorageAccountName = $StorageAccountName
}
New-AzureVirtualMachine @VMParams

## Load webpage on default browser
Start-Process "http://$Pip"
