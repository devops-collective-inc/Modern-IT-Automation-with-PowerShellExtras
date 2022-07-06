# Data Store Demo

## Summary

This folder contains demonstration functions that create and mantain _data stores_.
These functions model a real system, but have been greatly simplified for use in examples.

Included with the functions script are Pester test files, comprising the tests from examples in the _Mocking_ chapter of the book.
Examples 4, 9, 13, 22, 30, 33, 36, 40, and 43 show these test files running, and they're included here so you can experiment with and run them yourself.

The real system interfaces with databases, but these demonstration functions just create, modify, or delete CLIXML files containing PowerShell objects in a `.store` subdirectory of your user directory.

There's a [dummy API](https://github.com/TheFreeman193/mita-dummyapi/) that you can use with `Update-DataStore`.
See the [readme](https://github.com/TheFreeman193/mita-dummyapi/blob/main/README.md) of that repository for more details.

## Usage

+ Clone the extras repository
+ Ensure you have the latest versions of [PowerShell](https://docs.microsoft.com/en-gb/powershell/scripting/install/installing-powershell) and [Pester](https://pester.dev/docs/introduction/installation) installed.
+ Navigate to the `DataStoreDemo` directory of the cloned repository:

    ```PowerShell
    cd ./Edition-01/Mocking/DataStoreDemo/
    ```

+ To run all the Pester tests:

    ```PowerShell
    Invoke-Pester -Path ./Examples*.Tests.ps1 -Output Detailed
    ```

+ To run tests from a single file:

    ```PowerShell
    Invoke-Pester -Path ./Examples3and4.Tests.ps1 -Output Detailed
    ```

+ To use the demo functions in the current session:

    ```PowerShell
    . ./DataStoreFunctions.ps1
    ```

## Files

| Filename | Description |
| --- | --- |
| `DataStoreFunctions.ps1` | Script containing the demo store functions |
| `Examples3and4.Tests.ps1` | Pester tests from Examples 3 and 4 |
| `Examples5to8.Tests.ps1` | Pester tests from Examples 5 to 8 |
| `Examples10to12.Tests.ps1` | Pester tests from Examples 10 to 12 |
| `Examples14to21.Tests.ps1` | Pester tests from Examples 14 to 21 |
| `Examples23to29.Tests.ps1` | Pester tests from Examples 23 to 29 |
| `Examples31and32.Tests.ps1` | Pester tests from Examples 31 and 32 |
| `Examples34and35.Tests.ps1` | Pester tests from Examples 34 and 35 |
| `Examples37to39.Tests.ps1` | Pester tests from Examples 37 to 39 |
| `Examples41and42.Tests.ps1` | Pester tests from Examples 41 and 42 |

## Functions

### Get-DataStoreFile

The internal 'backbone' function that determines where data store files are and whether or not they should exist.
The other functions use this to determine the file path they should read from or write to.

```PowerShell
Get-DataStoreFile [-Name] <String> [-MustExist]
Get-DataStoreFile [-Name] <String> -MustNotExist
```

Returns `[System.IO.FileInfo]`

### New-DataStore

Creates and returns a new empty data store, with the current update set to now.

```PowerShell
New-DataStore [-Name] <String>
```

Returns `[PSCustomObject]`

### Remove-DataStore

Removes an existing data store.

```PowerShell
Remove-DataStore [-Name] <String>
```

### Get-DataStore

Retrieves the update date and contents of an existing data store.

```PowerShell
Get-DataStore [-Name] <String>
```

Returns `[PSCustomObject]`

### Set-DataStore

Changes the update date and contents of an existing data store.

```PowerShell
Set-DataStore [-Name] <String> [-Data] <PSObject> [-Update] <DateTime>
```

### Get-DataStoreDate

Retrieves only the update date of an existing data store.

```PowerShell
Get-DataStoreDate [-Name] <String>
```

Returns `[DateTime]`

### Set-DataStoreDate

Changes the update date of a data store without changing its contents.

```PowerShell
Set-DataStoreDate [-Name] <String> [-Update] <DateTime>
```

### Update-DataStore

Updates a data store with the latest content from a remote _bucket_ at the given URL.

```PowerShell
Update-DataStore [-Name] <String> [-Source] <String>
```
