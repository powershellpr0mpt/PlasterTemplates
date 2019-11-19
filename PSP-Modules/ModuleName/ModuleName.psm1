<#
    .DESCRIPTION
        Loader file for functions in <%= $PLASTER_PARAM_ModuleName %> module.

    .NOTES

        Name: <%= $PLASTER_PARAM_ModuleName %>
        Author: <%= $PLASTER_PARAM_FullName %>
        Version: <%= $PLASTER_PARAM_Version %>
        Blog: http://powershellpr0mpt.com

    .LINK
        http://powershellpr0mpt.com
#>

#Function Loader
[cmdletbinding()]
param()
Write-Verbose $PSScriptRoot

Write-Verbose 'Import Private Functions'
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

Write-Verbose 'Import Public Functions'
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
Foreach ($Function in @($Public + $Private)) {
    Try {
        . $Function.FullName
    }
    Catch {
        Write-Error -Message "Failed to import function $($Function.FullName): $_"
    }
}

### Export Public functions
Export-ModuleMember -Function $Public.Basename
