#
# Read from a File
Get-Content -Path 'demo.json' | ConvertFrom-Json
#
# Write to a File
$PSObject | ConvertTo-Json | Set-Content -Path 'demo.json'
