function Get-NumberTimesTwo {
    [CmdletBinding()]
    param (
        [int]$Number
    )
    $total = $Number * 2   ## total is scoped to the function, not globally
    Write-Debug $total
    return $total
}#Get-NumberTimesTwo
Get-NumberTimesTwo -Number 2 -Debug