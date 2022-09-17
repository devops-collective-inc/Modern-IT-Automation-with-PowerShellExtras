    # Create the PowerShell Module

    # Create a folder for the module

    $joinPathParams = @{
        Path = $env:ProgramFiles
        ChildPath = "WindowsPowerShell\Modules\TestJEAModule"
    }

    $modulePath = Join-Path @joinPathParams
    New-Item -ItemType Directory -Path $modulePath
    # Create an empty script module
    New-Item -ItemType File -Path (Join-Path $modulePath "TestJEAModule.psm1")

    # Create a PowerShell Module Manifest File

    $moduleManifestParams = @{
        Path = Join-Path $modulePath "TestJEAModule.psd1"
        RootModule = "TestJEAModule.psm1"
    }

    New-ModuleManifest @moduleManifestParams
