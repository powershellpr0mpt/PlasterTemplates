$manifestProperties = @{
    Path            = ".PSP-Modules\PlasterManifest.xml"
    Title           = "PSP-Modules Plaster Template"
    TemplateName    = 'PSP-Modules'
    TemplateVersion = '0.1.0'
    TemplateType    = 'Project'
    Description     = 'Create new PSP modules quickly and painfully using Plaster'
    Author          = 'Robert Prust'
}

if (!(Test-Path (Split-Path -Parent $manifestProperties.Path))) {
    $Null = New-Item -ItemType Directory -Path (Split-Path -Parent $manifestProperties.Path)
}

New-PlasterManifest @manifestProperties

$Plaster = @{
    TemplatePath    = Split-Path -Parent $manifestProperties.Path
    DestinationPath = "$Env:USERPROFILE\Documents\PowerShell\NewModule"
}

if (!(Test-Path -Path $plaster.DestinationPath)) {
    $Null = New-Item -ItemType Directory -Path $plaster.DestinationPath
}

Invoke-Plaster @plaster -Verbose

## Cleanup
## Remove-Item -Path $Plaster.DestinationPath -Recurse -Force