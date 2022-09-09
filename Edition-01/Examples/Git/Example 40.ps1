# Example 39a: Commit changes to line 2 of test.txt
Add-Content ./test.txt 'This is a different line'
git add ./test.txt
git commit -m 'Added a different second line'

# Example 39b: View the changed file
Get-Content ./test.txt
