# Example 1: Test 'not-null' -eq $null.
# In this test, it will evaluate to be $false,
# so no changes are applied.
'not-null' ?? 'is null'
# Example 2: Test $null -eq $null.
# In this test, it will evaluate to be $false,
# so 'is null' is returned.
$null ?? 'is null'
