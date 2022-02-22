# star-wars-data-demo

## Summary

This repo contains a sample **PowerShell** script and various **Pester** tests.

The purpose of the repo is to demonstrate Pester usage for both standard and mocked tests.
The script wraps a Star Wars API site located here: <https://mc-starwars-data.azurewebsites.net>
This site is hosted in Azure and maintained by Matt Corr.

The repo is uses as the sample for **The AAA Approach** chapter in the **Modern IT Automation with PowerShell** book.

> TODO: Get links to the book when ready.

## Files

| Filename | Description |
|---|---|
|StarWarsData.ps1|PowerShell script containing a wrapper for searching and returning Star Wars people, planets and films|
|StarWarsData.Simple.Tests.ps1|Contains simple Pester tests|
|StarWarsData.Mocked.Tests.ps1|The same tests as Simple, but with a mocked backend _(in case the real backend is offline)_|
|StarWarsData.Complex.Tests.ps1|Contains slightly more complex Pester tests|

## Usage

- Clone this repo locally.
- Ensure you have the latest versions of [PowerShell](https://docs.microsoft.com/en-gb/powershell/scripting/install/installing-powershell?view=powershell-7.2) and [Pester](https://pester-docs.netlify.app/docs/introduction/installation) installed.
- It is recommended to use [Visual Studio Code](https://code.visualstudio.com/) as it is the de-facto editor for PowerShell scripts.
- Install the [PowerShell plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
- Optionally, you can install a Pester plugin from the Marketplace, but take care as they can be buggy. </br> _(Although the [Pester Tests plugin](https://marketplace.visualstudio.com/items?itemName=pspester.pester-test) seems good)_
- Navigate to the `/src` folder and run the following command to trigger the tests:

    ```powershell
    > Invoke-Pester -Path ./StarWarsData.*.Tests.ps1 -Output Detailed
    ```

- Users can tweak the `Invoke-Pester` command parameters _(i.e. filter on tags or just run one Test file)_ or use the UI in Visual Studio Code to run the tests.

