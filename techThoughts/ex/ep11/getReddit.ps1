<#
.SYNOPSIS
    Launches the default browser to display reddit pictures.
.DESCRIPTION
    This command launches the default browser to display reddit pictures.
.EXAMPLE
    Show-Pics -URL https://i.imgur.com/fcuRqwl.jpg

    Launches the default browser to provided link.
.EXAMPLE
    $severalURLs | Show-Pics

    Launches tabs in default browser for each provided link.
.PARAMETER URL
    i.redd.it or v.redd.it or imgur URL 
.NOTES
    Jake MOrrison - @jakemorrison -https://techthoughts.info
#>

function Show-Pics {
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, ValueFromPipeline = $true,
        HelpMessage = 'i.redd.it or v.redd.it or imgur URL')]
    [ValidatePattern('i.redd.it|v.redd.it|imgur')]
    [string]$URL
)

    begin {
        Write-Verbose "Starting Show-Pics function."
    }
    process {
        try {
            Start-Process $URL -ErrorAction Stop
            Write-Verbose "Browser launch successful."
        }
        catch {
            Write-Error $_
         }
    }
    end {
        Write-Verbose "That's All Folks!"
    }
}#Show-Pics

<#
.SYNOPSIS
    PowerShell base interactive reddit browser
.DESCRIPTION
    Uses PowerShell to connect to reddit and pulls down a JSON payload for the specified subreddit. the number of threads (defalut: 3) specified by the user.
.PARAMETER Subreddit
    The name of the desired subreddit; ex: PowerShell or aww
.PARAMETER Threads
    The number of threads to pull down; default: 3
.PARAMETER ShowPics
    Determines if pics will be shown (if available)
.EXAMPLE
    Get-Reddit -Subreddit PowerShell

    Retrieves the top 3 threads from the PowerShell subreddit
.EXAMPLE
    Get-Reddit -Subreddit aww -Threads 4 -ShowPics

    Retrieves the top 4 threads from the aww subreddit and shows the pics if available
.NOTES
    Jake Morrison - @jakemorrison -https://techthoughts.info
#>

function Get-Reddit {
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $false,
            Position = 1,
            HelpMessage = 'The name of the desired subreddit')]
        [string]$Subreddit,

        [Parameter(Mandatory = $false,
            ValueFromPipeline = $false,
            Position = 2,
            HelpMessage = 'The number of threads that will be pulled down')]
        [ValidateRange(1, 25)]
        [int]$Threads = 3,

        [Parameter(Mandatory = $false,
            ValueFromPipeline = $false,
            Position = 3,
            HelpMessage = 'Determines if pics will be shown (if available)')]
        [switch]$ShowPics
    )

    Write-Verbose "Specified subreddit: $Subreddit"
    Write-Verbose "Specified # of threads: $Threads"

    $results = [System.Collections.ArrayList]@()

    Write-Verbose "Initiating Download"
    $uri = "http://www.reddit.com/r/$Subreddit/.json"
    Write-Verbose "URI: $uri"

    try {
        $invokeWebRequestSplat = @{
            Uri         = $uri
            ErrorAction = 'Stop'
        }
        $rawReddit = Invoke-WebRequest @invokeWebRequestSplat
        Write-Verbose "Download successful."
    }
    catch {
        Write-Error $_
        return $results
    }

    if ($rawReddit) {

        Write-Verbose "Converting JSON..."
        $redditInfo = $rawReddit | ConvertFrom-Json

        Write-Verbose "Generating output..."
        for ($i = 0; $i -lt $Threads; $i++) {
            $childObject = $null #reset
            $childObject = $redditInfo.data.children.data[$i]

            $obj = [PSCustomObject]@{
                Title    = $childObject.title
                URL      = $childObject.url
                # PermaLink = $childObject.permalink
                Score    = $childObject.score
                # Ups       = $childObject.ups
                # Downs     = $childObject.downs
                Author   = $childObject.author
                Comments = $childObject.num_comments
            }
            $results.Add($obj) | Out-Null
            if ($obj.URL -like "*i.redd.it*" -or $obj.URL -like "*imgur*" -or $obj.URL -like "*v.redd.it*" -and $ShowPics) {
                Show-Pics -url $obj.URL
            }
        }
    }#if_rawReddit
    else {
        Write-Warning -Message 'No information was returned from reddit.'
    }#else_rawReddit

    return $results

}#Get-Reddit