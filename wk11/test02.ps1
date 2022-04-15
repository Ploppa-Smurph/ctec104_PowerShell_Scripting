cls
# this is to collect Bios information from local and remote computers

#Write info to the screen
Write-Host "Type SINGLE to collect information from a single computer"
Write-Host "Type FILE to collect information from a list."
Write-Host "Type AD to collect from AD computers"
Write-Host "---------------------------------------------------------"

# create variable $CH for choice
$CH=Read-Host "Enter your choice:"

if($CH -eq "single")
{
# set $CN as variable that holds computer name input 
$CN = Read-Host "Enter the computer name:-"
# cmdlet to get bios informaton
Get-CimInstance -Class win32_bios -ComputerName $CN
}

if($CH -eq "file")
{
# set $FN as variable that holds file name input
$FN = Read-Host "Enter your file name with path:-"
get-ciminstance -class win32_bios -ComputerName $FN
}  

# cannot get the Active Directory to work - says unrecognized cmdlet
if($CH -eq "ad")
{
Get-CimInstance -Class win32_bios -ComputerName (get-adcomputer -filter * | select -exp name)
}