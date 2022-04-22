$x = 1..10 
Function Get-Sum ($a) {
Return ($a | Measure-Object -Sum).Sum
}
#call the function... 
cls 
write-host " my sum of 10 numbers " 
Get-Sum ($x )