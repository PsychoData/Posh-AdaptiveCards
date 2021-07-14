# Posh-AdaptiveCards

PowerShell Module to make it much simpler to install and use the [.NET AdaptiveCard Templating SDK](https://docs.microsoft.com/en-us/adaptive-cards/templating/sdk#net). For more information on Adaptive Cards in general, take a look at the [Adaptive Cards landing page](https://adaptivecards.io/).

## Installation

```powershell
Install-Module -Name Posh-AdaptiveCards    
```

## Prototyping / Designing Cards

For prototyping or designing your cards, I would highly recommend the [Adaptive Cards Designer](https://adaptivecards.io/designer/) or maybe take a look at some [Samples](https://adaptivecards.io/samples/).

## What are Templates

Templates let you apply significant formatting to simpler data, to make it into a much more displayable, _adaptable_, and reusable state. For more information check out the [Templating Overview](https://docs.microsoft.com/en-us/adaptive-cards/templating/).

## More info & References

Here are a few references that may be useful

- [Adaptive Cards Repo](https://github.com/microsoft/AdaptiveCards)
- [Adaptive Cards Designer](https://adaptivecards.io/designer/)
- [Schema Explorer](https://adaptivecards.io/explorer/)
- [Documentation](https://adaptivecards.io/documentation/)
- [Sample Cards](https://adaptivecards.io/samples/)
- [Roadmap](https://portal.productboard.com/adaptivecards/1-adaptive-cards-features/tabs/5-launched)

## Contributing to the Community

If you think your template might be useful to others, consider submitting it to the [central template repo](https://github.com/microsoft/adaptivecards-templates#contributing-templates) for the [Adaptive Card Template Service](https://docs.microsoft.com/en-us/adaptive-cards/templating/service). This will allow the AdaptiveCard Templates to be [discovered](https://docs.microsoft.com/en-us/adaptive-cards/templating/service#find-a-template) and [used](https://docs.microsoft.com/en-us/adaptive-cards/templating/service#populate-a-template-server-side) through the Template Service API, as well as making the templates [publicly accessible](https://docs.microsoft.com/en-us/adaptive-cards/templating/service#get-a-template) if you want to populate it offline.

## Example

Note: These Here-strings **must be** single-quote, and not double-quote.

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
            "Name": "Matt Thompson"
}
'@
New-AdaptiveCardInstance -Data $DataCardJSON -Template $TemplateJSON
```

which yields the ready-to-post JSON

```json
{"type":"AdaptiveCard","version":"1.3","body":[{"type":"TextBlock","text":"Hello Matt Thompson!"}]}
```

## Double-Quotes and Powershell

AdaptiveCard Templating uses a format of `${Object.Property}` for it's variables. PowerShell uses a similar and [compatible format](https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-string-substitutions?view=powershell-7.1#delineation-with-braces) for its normal variables. Strings you use to create your strings should be [Single-quotes](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.1#single-and-double-quoted-strings) to prevent PowerShell mistakenly trying to expand the variable too early.

```powershell
$quoteSampleTemplate = @'
{ "Property": "${Value}" }
'@
```

and not double-quotes

```powershell
#THIS will not work as expected due to double-quotes Variable Expansion
$doubleQuoteSampleTemplate = @"
{ "Property": "${Value}" } 
"@
```

![image](https://user-images.githubusercontent.com/3719116/125485500-6b0b347e-85e3-422c-a8d8-eba74ece9b0c.png)
