# In this instance, we are testing to make sure
# that the process doesn't contain the PowerShell Process
if ((Get-Process).Name -notcontains 'pwsh') {
    # The process doesn't exist
} else {
    # The process does exist
}
