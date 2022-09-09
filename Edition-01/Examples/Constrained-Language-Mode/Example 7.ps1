class Fake {}

$ExecutionContext.SessionState.LanguageMode = 'ConstrainedLanguage'

New-Object -TypeName Fake

[Fake]::new()
