# getWeather example from techThoughts Youtube channel

<#
.SYNOPSIS
    Returns weather information.    
.DESCRIPTION
    Returns the weather for a given location; defaults to current IP address. 
.EXAMPLE
    Get-Weather

    Returns Full weather information for current IP with all defaults
.EXAMPLE
    Get-Weather -Short

    Returns basic weather informatoin based on location for your IP.
.EXAMPLE
    Get-Weather -City 'Shreveport' -Units Metric -Language 'en'
    
    Returns FULL weather information for Shreveport in metric units with English language.
.EXAMPLE
    Get-Weather -City 'San Antonio' -Units USCS -Short

    Returns Basic weather information for San Antonio in USCS units.
.PARAMETER City
    The city to get the weather for. -- If not specified will default to your IP address.
.PARAMETER Units
    The units to use for the weather- Metric or USCS.
.PARAMETER Language
    The language to display results.
.PARAMETER Short
    If specified will return only the basic weather information.
.NOTES
    https://github.com/chubin/wttr.in
    https://wttr.in/:help
#>

function Get-Weather {
    [CmdletBinding()]
    param (
        [Parameter(
            Position = 0,
            Mandatory = $false
            )]
        [string]
        $City,
        
        [Parameter(Position = 1)]
        [ValidateSet('Metric', 'USCS')]
        [string]
        $Units = 'USCS',
        
        [Parameter(Position = 2)]
        [ValidateSet('ar','af','be','ca','cs','da','de','el','en','es','et','fi','fr','gl','hr','hu','id','it','ja','ko','lt','lv','ms','nl','no','pl','pt','ro','ru','sk','sl','sr','sv','th','tr','uk','vi','zh')]
        [string]
        $Language = 'en',
        
        [Parameter(Position = 3)]
        [switch]
        $Short
    )

    $uriString = 'https://wttr.in/'


    if($City) {
        $uriString += '$City'
    }

    switch ($Units) {
        'Metric' {
            $uriString += "?m"
        }
        'USCS' {
            $uriString += "?u"
        }
    }

    if ($Short) {
        $uriString += "&format=4"
    }

    $uriString += "&lang=$Language"

    Write-Verbose "URI: $uriString"

    $invokeSplat = @{
        URI = $uriString
        ErrorAction = 'Stop'
    }

    try {
        Invoke-RestMethod @invokeSplat
    }
    catch {
        Write-Error $_
    }
}#Get-Weather