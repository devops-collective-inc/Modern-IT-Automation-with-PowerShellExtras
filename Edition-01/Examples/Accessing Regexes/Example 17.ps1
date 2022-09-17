Get-Alias | Where-Object { $_.Name -match '^s.{4}$' }

Get-Alias | Where-Object Name -Match '^s.{4}$'
