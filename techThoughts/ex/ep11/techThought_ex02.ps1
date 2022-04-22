#### From TechThoughts Youtube Channel : https://www.youtube.com/watch?v=qrwPvbCWRtI
## Anatomy of a PowerShell Function
# function help (optional but encouraged)
# function name
# CmdletBinding (optional)
# parameters (optional)
# function logic (optional Begin / Process / End)
# return (optional)

<#
.SYNOPSIS
    Returns public IP address
.DESCRIPTION
    Queries the ipify Public IP Address API and returns your public IP
.EXAMPLE
    Get-PublicIP
    
    Returns the public IP
.OUTPUTS
    System.String
.NOTES
    https://github.com/rdegges/ipify-api
#>

function GetPublicIP {
    [CmdletBinding()]    # in vscode you can type : paramblock to Template the CmdletBinding 
    param(

    )
    $uri = 'https://api.ipify.org'
    Write-Verbose -Message "Pulling public IP from $uri"
    try {
        $invokeRestMethodSplat = @{
            URI = $uri
            ErrorAction = 'Stop'
        }
        $publicIP = Invoke-RestMethod @invokeRestMethodSplat
    }
    catch {
        Write-Error $_    
    }
    
    return $publicIP
    }
GetPublicIP