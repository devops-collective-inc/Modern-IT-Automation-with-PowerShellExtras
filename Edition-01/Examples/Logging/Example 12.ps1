Connect-AzureAD

Get-AzureADUser |
    Select-Object UserPrincipalName, DisplayName |
    Out-File ./output/AzureUserList.txt
