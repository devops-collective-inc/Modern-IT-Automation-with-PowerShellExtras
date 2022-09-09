# Set Constrained Language Mode
$ExecutionContext.SessionState.LanguageMode = 'ConstrainedLanguage'

# Define C# Class
$Source = @"
public class Demo
{
    public static int Add(int a, int b)
    {
        return (a + b);
    }
}
"@

# Load the Class
Add-Type -TypeDefinition $Source
