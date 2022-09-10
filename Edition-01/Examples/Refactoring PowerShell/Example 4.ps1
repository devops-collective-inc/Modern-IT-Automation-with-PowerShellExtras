#
# Example 1: Basic Usage with a Hashtable
# Define the Hashtable
$Hashtable = @{
    Name = 'Michael Zanatta'
    Age = 21
    Occupation = 'PowerShell Developer'
    TreeColor = 'Green'
}

# Adding a Key
$Hashtable.Salary = '$50000'

# Removing a Key
$Hashtable.Remove('TreeColor')

# Updating a Key
$Hashtable.Age = 30

# Output the Hashtable
$Hashtable
