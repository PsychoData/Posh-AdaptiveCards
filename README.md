# Posh-AdaptiveCards

PowerShell Module to make it much simpler to install and use the [.NET AdaptiveCard Templating SDK](https://docs.microsoft.com/en-us/adaptive-cards/templating/sdk#net). 

## Installation

```powershell
Install-Module -Name Posh-AdaptiveCards    
```

## Example

Note: The Here-Strings are Single-quotes 

```powershell
$variable = @'  
{ "Property": "${Value}" }
'@
``` 
and not double-quotes 
```powershell
#THIS will not work as expected due to double-quotes Variable Expansion
$variable = @"
{ "Property": "${Value}" }
"@
``` 
because otherwise the `${Name}` will be seen as a PowerShell variable and will already expand before it reaches the New-AdaptiveCardInstance cmdlet. 

```powershell
Install-Module -Name Posh-AdaptiveCards    

$TemplateJSON= @'
{
    "type": "AdaptiveCard",
    "version": "1.3",
    "body": [
        {
            "type": "TextBlock",
            "text": "Hello ${Name}!"
        }
    ]
}
'@ 
$DataJSON = @'
{
            "Name": "Matt Hidinger"
}
'@
New-AdaptiveCardInstance -Data $DataCardJSON -Template $TemplateJSON
```
which yields the ready-to-post JSON 
 
```json
{"type":"AdaptiveCard","version":"1.3","body":[{"type":"TextBlock","text":"Hello Matt Hidinger!"}]}
```
