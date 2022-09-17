#  Module.psm1 saved in C:\Windows\System32\WindowsPowerShell\v1.0\Modules
function Do-Something {
    # Perform a Restricted Action
    [System.Net.WebClient]::new().DownloadFile(
        'https://google.com/favicon.ico', 'D:\TEMP\SomeFile.html'
    )
}
