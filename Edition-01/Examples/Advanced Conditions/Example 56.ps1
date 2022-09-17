# Example 1: VariableName
$va? = 'test'
${va?}

# Example 2: SubExpression
$var = 'string'
$($var)?.Replace('g','gs')

# Example 3: SubExpression, with quotation
$va? = 'test'
${va?}?.Replace('e', 'oa')

# Example 4: SubExpression, with quotation
$va? = $null
${va?}?.Replace('e', 'oa')
