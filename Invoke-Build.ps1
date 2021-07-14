$module = 'Posh-AdaptiveCards'
Push-Location $PSScriptroot

.\Clean-BuildEnv.ps1
dotnet publish $PSScriptRoot\src -o $PSScriptRoot\output\$module\bin
$dllsToInclude = Get-ChildItem $PSScriptRoot\output\$module\bin -Filter '*.dll'
#dotnet build $PSScriptRoot\src -o $PSScriptRoot\output\$module\bin

Write-Host "Psscriptroot: $PSScriptroot"
Copy-Item "$PSScriptRoot\$module\*" "$PSScriptRoot\output\$module\" -Recurse -Force 
Push-Location .\output\$module\
$manifest = @{
    Path               = "$PSScriptRoot\output\$module\Posh-AdaptiveCards.psd1"
    RequiredAssemblies = @(($dllsToInclude | Resolve-Path -Relative) -replace "^\.\\output\\$module\\" )
}
Update-ModuleManifest @manifest

Import-Module "$PSScriptRoot\Output\$module\$module.psd1" -Verbose
#Invoke-Pester "$PSScriptRoot\Tests"
