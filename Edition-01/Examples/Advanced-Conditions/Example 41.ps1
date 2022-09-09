# Fetch the Processes and Select the Name property
if ((Get-Process).Name -contains 'pwsh') {
    # Do something
}
