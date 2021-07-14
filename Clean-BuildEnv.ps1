$module = 'Posh-AdaptiveCards'
Push-Location $PSScriptroot

#Unload Module
Get-Module $module | Remove-Module -Force

#attempt dotnet cleans, follow up with manual cleanup
#(currently sometimes throwing unimportant errors around switching DLL's/csproj's across Platforms)
dotnet clean $PSScriptRoot\src -o bin
dotnet clean $PSScriptRoot\src -o $PSScriptRoot\output\$module\bin

#Manual Cleanup of directories
#Get-ChildItem -Path "$PSScriptRoot\output\$module\bin", "$PSScriptRoot\src\bin", "$PSScriptRoot\src\obj", "$PSScriptRoot\output\$module\$module.ps*" -ErrorAction SilentlyContinue | Remove-Item -Recurse
Get-ChildItem -Path "$PSScriptRoot\output\$module\", "$PSScriptRoot\src\bin", "$PSScriptRoot\src\obj" -Force -ErrorAction SilentlyContinue -Exclude '.gitkeep' | Remove-Item -Recurse -Force
