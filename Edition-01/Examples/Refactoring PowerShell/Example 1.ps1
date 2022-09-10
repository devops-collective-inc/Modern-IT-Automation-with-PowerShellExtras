# Apply Filtering Left by selecting the processes that we need.
# Where-Object isn't required here.
$DuplicateProcesses = Get-Process node, pwsh, sh, git |
    # The object properties are selected before
    # the grouping since it's more difficult
    # after Group-Object has executed.
    Select-Object -Property Name, Id |
    Group-Object -Property Name |
    Sort-Object -Property Name
