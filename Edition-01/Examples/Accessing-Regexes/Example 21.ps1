$MyRegex = New-Object Regex -ArgumentList '\[(?:ERROR|WARN *)\]'

# OR

$MyRegex = [regex]::new('\[(?:ERROR|WARN *)\]')
