# Run it a second time, this time with a parameter
$null = $Culture.GetConsoleFallbackUICulture($true)
# Retrieve the call history
$Culture._GetConsoleFallbackUICulture
