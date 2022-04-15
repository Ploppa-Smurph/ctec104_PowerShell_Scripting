clear  
$files = $null  # create variables 'files' and 'dirs' -- look at current dir and store folders and files to variable
$dirs = $null

$content = Get-ChildItem .

ForEach ($_ in $content){
    If($_.psIsContainer -eq $true){   # checks to see if the data object is a 'folder'
            [array]$dirs += $_.Name
    }
    Else{
        [array]$files += $_.Name
    }

}

'Files in the Current Folder'
$files

"`n"
'Subdirectories in the Current Folder'
$dirs