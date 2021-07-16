#Requires -Assembly ".\bin\Posh_AdaptiveCards.dll"
#Requires -Assembly ".\bin\AdaptiveCards.Templating.dll"

#Add-Type -Path .\Build\AdaptiveCards.Templating.1.2.1\lib\netstandard2.0\AdaptiveCards.Templating.dll -Verbose
#$pbipath = Resolve-Path "C:\repos\Posh-AdaptiveCards\Build\AdaptiveCards.Templating.1.2.1\lib\netstandard2.0\AdaptiveCards.Templating.dll"
#$assembly = [System.Reflection.Assembly]::LoadFrom($pbipath)

# $templateJson = @"
# {
#     "type": "AdaptiveCard",
#     "version": "1.2",
#     "body": [
#         {
#             "type": "TextBlock",
#             "text": "Hello $("Name")!"
#         }
#     ]
# }
# "@
# $jsonData = @"
# {
#     "strings": {
#         "myName": "My name is {0} {1}"
#     },
#     "person": {
#         "firstName": "Andrew",
#         "lastName": "Leader"
#     }
# }
# "@
# Get-ChildItem .\Build\packages\ -Recurse -Filter "*.dll" | ForEach-Object {
#Get-ChildItem .\Build\packages\ -Recurse -Filter "*.dll" | ForEach-Object {
#     try
#     {
#         Add-Type -Path $_.FullName
#     }
#     catch [System.Exception]
#     {
#     }
# }

# $templateObj = [AdaptiveCards.Templating.AdaptiveCardTemplate]::new($templateJson)
# $templateObj.Expand($jsonData)

#Get-ChildItem .\Build\packages\ -Recurse -Filter "*.dll" | ForEach-Object {
#Get-ChildItem ".\bin\Debug\netstandard2.0\Posh_AdaptiveCards.dll" -Recurse -Filter "*.dll" | ForEach-Object {
# Get-ChildItem ".\*.dll" -Recurse -Filter "*.dll" | ForEach-Object {
#         # try
#     # {
#         Add-Type -Path $_.FullName
#     # }
#     # catch [System.Exception]
#     # {
#     # }
# }
#Add-Type -Path ".\bin\Posh_AdaptiveCards.dll" -Verbose
#Add-Type -Path ".\bin\AdaptiveCards.Templating.dll"

function New-AdaptiveCardTemplate {
    [CmdletBinding()]
    param (
        # Template JSON
        [Parameter(ValueFromPipeline)]
        [String]
        $Template
    )
    
    begin {
    }
    
    process {
        return [AdaptiveCards.Templating.AdaptiveCardTemplate]::new($Template)
    }
    
    end {
        
    }
}

function New-AdaptiveCardInstance {
    [CmdletBinding()]
    param (
        # Template
        [Parameter()]
        [ValidateScript( { $_ -as [AdaptiveCards.Templating.AdaptiveCardTemplate] })]
        [AdaptiveCards.Templating.AdaptiveCardTemplate]
        $Template,
        # Data
        [Parameter(ValueFromPipeline)]
        [String]
        $Data
    )
    
    begin {
    }
    
    process {
        $Template.Expand($Data)
    }
    
    end {
        
    }
}
